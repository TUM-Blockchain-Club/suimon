const fs = require('fs');

// Converts a hex string (prefixed with '0x') to a little-endian byte array
function hexToLittleEndianBytes(hexStr, byteLength) {
  // Remove '0x' prefix if present
  hexStr = hexStr.startsWith('0x') ? hexStr.slice(2) : hexStr;
  // Pad the hex string to the desired byte length (in hex digits)
  hexStr = hexStr.padStart(byteLength * 2, '0');
  // Convert to a byte array
  const bigEndianBytes = Buffer.from(hexStr, 'hex');
  // Reverse to get little-endian
  return Array.from(bigEndianBytes.reverse());
}

// Serialize a field element (assuming 256-bit fields)
function serializeFieldElement(element) {
  return hexToLittleEndianBytes(element, 32);
}

// Serialize a G1 point
function serializeG1(point) {
  // Each coordinate is a field element
  const xBytes = serializeFieldElement(point[0]);
  const yBytes = serializeFieldElement(point[1]);
  return xBytes.concat(yBytes);
}

// Serialize a G2 point
function serializeG2(point) {
  // Each coordinate is a pair of field elements (for Fp2 elements)
  const x0Bytes = serializeFieldElement(point[0][0]);
  const x1Bytes = serializeFieldElement(point[0][1]);
  const y0Bytes = serializeFieldElement(point[1][0]);
  const y1Bytes = serializeFieldElement(point[1][1]);
  return x0Bytes.concat(x1Bytes, y0Bytes, y1Bytes);
}

// Load the verification key JSON
const vk = JSON.parse(fs.readFileSync('verification_key.json'));

// Serialize vk_alpha_1
const vk_alpha_1_bytes = serializeG1(vk.vk_alpha_1);

// Serialize vk_beta_2
const vk_beta_2_bytes = serializeG2(vk.vk_beta_2);

// Serialize vk_gamma_2
const vk_gamma_2_bytes = serializeG2(vk.vk_gamma_2);

// Serialize vk_delta_2
const vk_delta_2_bytes = serializeG2(vk.vk_delta_2);

// Serialize vk_ic (array of G1 points)
const vk_ic_bytes = vk.IC.reduce((acc, point) => {
  return acc.concat(serializeG1(point));
}, []);

// Concatenate all bytes
const verifierKeyBytes = vk_alpha_1_bytes
  .concat(vk_beta_2_bytes)
  .concat(vk_gamma_2_bytes)
  .concat(vk_delta_2_bytes)
  .concat(vk_ic_bytes);

// print verifier key as hex string
console.log(verifierKeyBytes);

// Optionally, write the serialized verifier key to a file
fs.writeFileSync('verifier_key.bin', Buffer.from(verifierKeyBytes));
