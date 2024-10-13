use crate::messages::*;
use ark_bn254::Bn254;
use ark_circom::{CircomBuilder, CircomConfig};
use ark_groth16::{Groth16, prepare_verifying_key};
use ark_serialize::CanonicalSerialize;
use ark_snark::SNARK;
use rand::rngs::StdRng;
use rand::SeedableRng;
use std::error::Error;

pub async fn communicate() {
    // Get the receiver for ProofGenerationRequest messages from Dart
    let mut receiver = ProofGenerationRequest::get_dart_signal_receiver();

    while let Some(dart_signal) = receiver.recv().await {
        let message: ProofGenerationRequest = dart_signal.message;
        let a = message.a;
        let b = message.b;

        // Perform proof generation using a and b
        let proof_result = generate_groth16_proof(a, b).await;

        match proof_result {
            Ok((vk_bytes, proof_bytes, public_inputs_bytes)) => {
                // Prepare the response message
                let response = ProofGenerationResponse {
                    verifying_key: vk_bytes,
                    proof: proof_bytes,
                    public_inputs: public_inputs_bytes,
                };

                // Send response back to Dart
                response.send_signal_to_dart();
            },
            Err(e) => {
                // Handle errors and optionally send an error message back to Dart
                eprintln!("Error generating proof: {:?}", e);
                // Optionally send an error message to Dart
                // ErrorMessage { error_message: format!("{:?}", e) }.send_signal_to_dart();
            },
        }
    }
}

async fn generate_groth16_proof(a: u64, b: u64) -> Result<(Vec<u8>, Vec<u8>, Vec<u8>), Box<dyn Error>> {
    // Load the WASM and R1CS for witness and proof generation
    let cfg = CircomConfig::<Bn254>::new(
        "path/to/main.wasm", // Update the path accordingly
        "path/to/main.r1cs", // Update the path accordingly
    )?;

    let mut builder = CircomBuilder::new(cfg);

    // Private inputs
    builder.push_input("a", a);
    builder.push_input("b", b);

    let circuit = builder.setup();

    // Generate a random proving key
    let mut rng: StdRng = SeedableRng::from_seed([0; 32]);
    let pk = Groth16::<Bn254>::generate_random_parameters_with_reduction(circuit, &mut rng)?;

    let circuit = builder.build()?;
    let public_inputs = circuit.get_public_inputs()?;

    // Create proof
    let proof = Groth16::<Bn254>::prove(&pk, circuit, &mut rng)?;

    // Verify proof
    let pvk = prepare_verifying_key(&pk.vk);
    let verified = Groth16::<Bn254>::verify_with_processed_vk(&pvk, &public_inputs, &proof)?;
    assert!(verified);

    // Serialize verifying key
    let mut vk_bytes = Vec::new();
    pk.vk.serialize_compressed(&mut vk_bytes)?;

    // Serialize proof
    let mut proof_bytes = Vec::new();
    proof.serialize_compressed(&mut proof_bytes)?;

    // Serialize public inputs
    let mut public_inputs_bytes = Vec::new();
    for input in public_inputs.iter() {
        input.serialize_compressed(&mut public_inputs_bytes)?;
    }

    Ok((vk_bytes, proof_bytes, public_inputs_bytes))
}
