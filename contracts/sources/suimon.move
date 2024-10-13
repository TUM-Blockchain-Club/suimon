module suimon::suimon {
    // Part 1: These imports are provided by default
    // use sui::url::{Url}; 
    use std::string::{String, utf8};
    use sui::groth16;
    use sui::random::{Random, new_generator};

    // Part 2: struct definitions
    // public struct Suimon has key, store {
    //     id: UID,
    //     name: String,
    //     description: String,
    //     image: Url,
    //     max_mint_per_epoch: u64,
    //     difficulty: u64,
    //     prevolution_collection: vector<UID>,
    //     nft_go_id: u64,
    // }

    public struct SuimonType has copy, drop, store{
        name: String,
        description: String,
    }

    public struct SuimonTable has key, store {
        id: UID,
        table: vector<SuimonType>
    }

    // TODO new seed every "epoch" (1h)
    // TODO check if hash is less than difficulty in verify_proof


    // public entry fun mint(nftID: UID, proof: byte_array, Optional<UID> prevolution: UID): UID {
    //      Check if the proof is valid
    //      let valid = check_proof(proof);
    //      assert(valid, 0x0, "Invalid proof");
    //      check for prevolution possibility
    //      check for double minting
    //      check for g
    //      cehck that number of mints is less than max_mint_per_epoch
    // 
    //    
    //  }

    // TODO get/set seed

    entry fun check_proof(_proof_bytes: vector<u8>, r: &Random, ctx: &mut TxContext): bool {
        // construct input bytes from seed+nonce+mon_id
        let mut generator = new_generator(r, ctx);



        let input_bytes = x"0100000001000000000000000000000000000000000000000000000000000000";
        let verify_key = x"94d781ec65145ed90beca1859d5f38ec4d1e30d4123424bb7b0c6fc618257b1551af0374b50e5da874ed3abbc80822e4378fdef9e72c423a66095361dacad8243d1a043fc217ea306d7c3dcab877be5f03502c824833fc4301ef8b712711c49ebd491d7424efffd121baf85244404bded1fe26bdf6ef5962a3361cef3ed1661d897d6654c60dca3d648ce82fa91dc737f35aa798fb52118bb20fd9ee1f84a7aabef505258940dc3bc9de41472e20634f311e5b6f7a17d82f2f2fcec06553f71e5cd295f9155e0f93cb7ed6f212d0ccddb01ebe7dd924c97a3f1fc9d03a9eb915020000000000000072548cb052d61ed254de62618c797853ad3b8a96c60141c2bfc12236638f1b0faf9ecf024817d8964c4b2fed6537bcd70600a85cdec0ca4b0435788dbffd81ab";
        let proof_bytes = x"212d4457550f258654a24a6871522797ab262dee4d7d1f89af7da90dc0904eac57ce183e6f7caca9a98755904c1398ff6288cec9877f98f2d3c776c448b9ad166839e09d77967b66129c4942eee6d3eaf4a0ce2a841acc873a46ae35e40f0088288d038857c70a1415300544d7cf376949a372049679afa35ee5206b58266184";
        
        let pvk = groth16::prepare_verifying_key(&groth16::bn254(), &verify_key);
        let proof = groth16::proof_points_from_bytes(proof_bytes);
        let inputs = groth16::public_proof_inputs_from_bytes(input_bytes);
        groth16::verify_groth16_proof(&groth16::bn254(), &pvk, &inputs, &proof)
    }
    
    public fun burn(id: UID) {
        object::delete(id);
    }

    // public fun evolve(mut user_collection: vector<UID>) {
    //     let mut iter: u64 = 0;
    //     let length = std::vector::length(&user_collection);
    //     while (iter < length) {
    //         let nft = user_collection.pop_back();
    //         burn(nft);
    //         iter = iter + 1;
    //     };
    //     ()
    // }

    public entry fun transfer(){
        
    }
    
    public fun setupTable(_ctx: &mut TxContext) {
        let suimonTable = vector<SuimonType>[
            SuimonType { name: utf8(b"Suimon"), description: utf8(b"A cute little creature") },
            SuimonType { name: utf8(b"Suimon"), description: utf8(b"A cute little creature") },
            SuimonType { name: utf8(b"Suimon"), description: utf8(b"A cute little creature") },
            SuimonType { name: utf8(b"Suimon"), description: utf8(b"A cute little creature") },
        ];

        let table = SuimonTable {
            id: object::new(_ctx),
            table: suimonTable,
        };

        transfer::public_freeze_object(table)
    }

    // Part 3: Module initializer to be executed when this module is published
    fun init(_ctx: &mut TxContext) {
        setupTable(_ctx);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(ctx)
    }


    // Part 4: Accessors required to read the struct fields
    // public fun magic(self: &Sword): u64 {
    //     self.magic
    // }

    // public fun strength(self: &Sword): u64 {
    //     self.strength
    // }

    // public fun swords_created(self: &Forge): u64 {
    //     self.swords_created
    // }

    // Part 5: Public/entry functions (introduced later in the tutorial)
    
    // Part 6: Tests
}
