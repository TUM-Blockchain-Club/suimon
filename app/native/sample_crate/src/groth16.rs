use ark_bn254::Bn254;
use ark_circom::CircomBuilder;
use ark_circom::CircomConfig;
use ark_groth16::{Groth16, prepare_verifying_key};
use ark_serialize::CanonicalSerialize;
use ark_snark::SNARK;
use rand::rngs::StdRng;
use rand::SeedableRng;
use rinf::{export, Type};

#[derive(Type)]
pub struct ProofData {
    pub vk_bytes: Vec<u8>,
    pub proof_bytes: Vec<u8>,
    pub public_inputs_bytes: Vec<u8>,
}

#[export]
pub fn generate_proof(a: u64, b: u64) -> ProofData {
    // Load the WASM and R1CS for witness and proof generation
    let cfg = CircomConfig::<Bn254>::new("../circuit/main_js/main.wasm", "../circuit/main.r1cs").unwrap();
    let mut builder = CircomBuilder::new(cfg);

    // Private inputs: A factorisation of a number
    builder.push_input("a", a);
    builder.push_input("b", b);

    let circuit = builder.setup();

    // Generate a random proving key
    let mut rng: StdRng = SeedableRng::from_seed([0; 32]);
    let pk = Groth16::<Bn254>::generate_random_parameters_with_reduction(circuit, &mut rng).unwrap();

    let circuit = builder.build().unwrap();
    let public_inputs = circuit.get_public_inputs().unwrap();

    // Create proof
    let proof = Groth16::<Bn254>::prove(&pk, circuit, &mut rng).unwrap();

    // Verify proof
    let pvk = prepare_verifying_key(&pk.vk);
    let verified = Groth16::<Bn254>::verify_with_processed_vk(&pvk, &public_inputs, &proof).unwrap();
    assert!(verified);

    // Serialize outputs
    let mut vk_bytes = Vec::new();
    pk.vk.serialize_compressed(&mut vk_bytes).unwrap();

    let mut proof_bytes = Vec::new();
    proof.serialize_compressed(&mut proof_bytes).unwrap();

    let mut public_inputs_bytes = Vec::new();
    for input in &public_inputs {
        input.serialize_compressed(&mut public_inputs_bytes).unwrap();
    }

    ProofData {
        vk_bytes,
        proof_bytes,
        public_inputs_bytes,
    }
}
