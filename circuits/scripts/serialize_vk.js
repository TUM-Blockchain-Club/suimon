const fs = require('fs');
const { serializeG1, serializeG2 } = require('./utils');

// Load verifier key
const vk = JSON.parse(fs.readFileSync('verification_key.json'));

// Serialize components
const vkAlpha1Bytes = serializeG1(vk.vk_alpha_1);
const vkBeta2Bytes = serializeG2(vk.vk_beta_2);
const vkGamma2Bytes = serializeG2(vk.vk_gamma_2);
const vkDelta2Bytes = serializeG2(vk.vk_delta_2);

// Serialize IC array
const icLengthBytes = Buffer.alloc(4); // Assuming uint32 for length
icLengthBytes.writeUInt32LE(vk.IC.length, 0);

const icBytesArray = vk.IC.map(serializeG1);
const icBytes = Buffer.concat(icBytesArray);

// Concatenate all bytes
const vkBytes = Buffer.concat([
  vkAlpha1Bytes,
  vkBeta2Bytes,
  vkGamma2Bytes,
  vkDelta2Bytes,
  icLengthBytes,
  icBytes,
]);

console.log(vkBytes.toString('hex'));

// Write to file
fs.writeFileSync('serialized_verifier_key.bin', vkBytes);
