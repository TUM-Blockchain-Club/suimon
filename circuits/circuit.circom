pragma circom  2.1.9;

include "circomlib/circuits/poseidon.circom";

template LocationCheck () {

  signal input seed;                // Random seed for current epoch
  signal input location;            // Prover's location (private)
  // signal input attester_pubkey;     // Android/iOS public key
  // signal input attester_signature;  // Signature of the location
  signal input suimon_id;           // ID of the suimon to mint
  signal input target_hash;         // Claimed hash(seed, location, suimon_id)

  // Verify the attester signature on the location
  // component verify = VerifySignature();
  // verify.pubkey <== attester_pubkey;
  // verify.signature <== attester_signature;
  // verify.message <== location;

  // Verify the correctness of the target hash
  component poseidon_all = Poseidon(3);
  poseidon_all.inputs[0] <== seed;
  poseidon_all.inputs[1] <== location;
  poseidon_all.inputs[2] <== suimon_id;
  target_hash === poseidon_all.out;
  
}

component main { public [seed, suimon_id, target_hash] } = LocationCheck();
