module SUIMON::example {
    // Part 1: These imports are provided by default
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::url::{Self, Url}; 
    use std::string::{Self, String};
    use std::vector;

    // Part 2: struct definitions
    public struct SUIMON has key, store{
        id: UID,
        name: String,
        description: String,
        image: Url,
        max_mint_per_epoch: u64,
        difficulty: u64,
        prevolution_collection: vector<UID>,
        nft_go_id: u64,
    }
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
    public entry fun check_proof(proof: u64): bool {
        // Check if the proof is valid
        // This is a placeholder function
        true
    }
    
    fun burn(uID: UID): bool {
        return true
    }

    public fun evolve(mut user_collection: vector<UID>): vector<UID> {
        let mut iter: u64 = 0;
        let length = std::vector::length(&user_collection);
        while (iter < length) {
            let nft = user_collection.pop_back();
            burn(nft);
            iter = iter + 1;
        }
        return user_collection;
    }

    public entry fun transfer(){

    }

    // Part 3: Module initializer to be executed when this module is published
    fun init(ctx: &mut TxContext) {
       //todo
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
