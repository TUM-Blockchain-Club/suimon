const BN = require('bn.js');

// Function to serialize BigInt to little-endian byte array
function bigIntToBytesLE(value, byteLength) {
  const bn = new BN(value.toString());
  const hex = bn.toArray('le', byteLength);
  return Buffer.from(hex);
}

// Serialize G1 point
function serializeG1(point) {
  const xBytes = bigIntToBytesLE(BigInt(point[0]), 32);
  const yBytes = bigIntToBytesLE(BigInt(point[1]), 32);
  return Buffer.concat([xBytes, yBytes]);
}

// Serialize G2 point
function serializeG2(point) {
  const x0Bytes = bigIntToBytesLE(BigInt(point[0][0]), 32);
  const x1Bytes = bigIntToBytesLE(BigInt(point[0][1]), 32);
  const y0Bytes = bigIntToBytesLE(BigInt(point[1][0]), 32);
  const y1Bytes = bigIntToBytesLE(BigInt(point[1][1]), 32);
  return Buffer.concat([x0Bytes, x1Bytes, y0Bytes, y1Bytes]);
}
