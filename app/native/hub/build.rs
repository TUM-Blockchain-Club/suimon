fn main() {
    prost_build::compile_protos(&["src/proof_generation.proto"], &["src/"]).unwrap();
}
