const fs = require('fs');
const { serializeG1, serializeG2 } = require('./utils');

// Serialize public inputs
function serializePublicInputs(inputs) {
  const lengthBytes = Buffer.alloc(4);
  lengthBytes.writeUInt32LE(inputs.length, 0);

  const inputsBytesArray = inputs.map((input) => {
    return bigIntToBytesLE(BigInt(input), 32);
  });

  const inputsBytes = Buffer.concat(inputsBytesArray);

  return Buffer.concat([lengthBytes, inputsBytes]);
}

// Load proof and public inputs
const proof = JSON.parse(fs.readFileSync('proof.json'));
const publicInputs = JSON.parse(fs.readFileSync('public.json'));

// Serialize proof components
const piABytes = serializeG1(proof.pi_a);
const piBBytes = serializeG2(proof.pi_b);
const piCBytes = serializeG1(proof.pi_c);

// Serialize public inputs
const publicInputsBytes = serializePublicInputs(publicInputs);

// Concatenate all bytes
const proofBytes = Buffer.concat([
  piABytes,
  piBBytes,
  piCBytes,
  publicInputsBytes,
]);

// Write to file
fs.writeFileSync('serialized_proof.bin', proofBytes);
