module suimon::suimon {
    // Part 1: These imports are provided by default
    use std::string::{Self, String, utf8};
    use sui::table;
    use sui::groth16;
    use sui::random::{Self, Random};
    use sui::package::{Self, Publisher};
    use std::debug;
    use sui::url::{Self, Url};
    use sui::clock::{Self,Clock};
    use 0x1::bcs;

    public struct Suimon has key, store {
        id: UID, // object ID
        number: u64, // internal id
        name: String, // Suimon name
        description: String, // Suimon description
        image: Url, // Suimon sprite
        max_mint_per_epoch: u64, // Max amount of mints per epoch
        rarity: u8,
    }

    public struct Suimons has key, store{
        // a data structure that holds all the suimons, it is needed for burning and minting through the evolve function
        id: UID,
        minted_per_epoch: table::Table<u64,u64>,
    }

    public struct SuimonType has copy, drop, store{
        number: u64,
        name: String,
        description: String,
        image: Url,
        rarity: u8,
        fusion_partners: vector<u64>,
        fusion_target: u64,
    }

    public struct SuimonTable has key, store {
        id: UID,
        table: vector<SuimonType>
    }

    public struct Epoch has key, store {
        id: UID,
        seed: u64,
        timestamp: u64,
        mints: u64,
    }

    public struct BattleParties has key, store {
        id: UID,
        monID1: Option<Suimon>,
        monID2: Option<Suimon>,
        owner1: address,
        owner2: address,
    }

    public struct Evolution has key, store{
        id: UID,
        fusionP1: Suimon,
        fusionP2: Suimon,
        fusion_target: u64,
    }

    fun init(ctx: &mut TxContext) {
        let battleParties = BattleParties {
            id: object::new(ctx),
            monID1: option::none(),
            monID2: option::none(),
            owner1: @0x0,
            owner2: @0x0,
        };
        setupTable(ctx);
        transfer::public_share_object(battleParties);
    }
    
    // Part 2: struct definitions
    fun check_proof(monId: u64, clock: &Clock, epoch: &mut Epoch, _proof_bytes: vector<u8>, nonce: u64, r: &Random, ctx: &mut TxContext): bool {
        let mut generator = random::new_generator(r, ctx);
        let seed;
        if (epoch.timestamp + 86400000 < clock::timestamp_ms(clock)) {
            seed = epoch.seed;
        }
        else{
            seed = random::generate_u64(&mut generator);
            epoch.seed = seed;
        };
        let nonce_bytes = bcs::to_bytes(&nonce);
        let monId_bytes = bcs::to_bytes(&monId);
        let seed_bytes = bcs::to_bytes(&seed);
        let mut input_bytes  = vector::empty<u8>();
        vector::append(&mut input_bytes, seed_bytes);
        vector::append(&mut input_bytes, nonce_bytes);
        vector::append(&mut input_bytes, monId_bytes);
        // let empty_bytes = vector::empty();
        // let appended_byte    = vector::append(&nonce_bytes, &monId_bytes);
        // let input_bytes = vector::append(&seed, &appended_bytes);
        // let input_bytes = seed;
        // construct input bytes from seed+nonce+mon_id
        // let input_bytes = x"0100000001000000000000000000000000000000000000000000000000000000";
        let verify_key = x"94d781ec65145ed90beca1859d5f38ec4d1e30d4123424bb7b0c6fc618257b1551af0374b50e5da874ed3abbc80822e4378fdef9e72c423a66095361dacad8243d1a043fc217ea306d7c3dcab877be5f03502c824833fc4301ef8b712711c49ebd491d7424efffd121baf85244404bded1fe26bdf6ef5962a3361cef3ed1661d897d6654c60dca3d648ce82fa91dc737f35aa798fb52118bb20fd9ee1f84a7aabef505258940dc3bc9de41472e20634f311e5b6f7a17d82f2f2fcec06553f71e5cd295f9155e0f93cb7ed6f212d0ccddb01ebe7dd924c97a3f1fc9d03a9eb915020000000000000072548cb052d61ed254de62618c797853ad3b8a96c60141c2bfc12236638f1b0faf9ecf024817d8964c4b2fed6537bcd70600a85cdec0ca4b0435788dbffd81ab";
        let proof_bytes = x"212d4457550f258654a24a6871522797ab262dee4d7d1f89af7da90dc0904eac57ce183e6f7caca9a98755904c1398ff6288cec9877f98f2d3c776c448b9ad166839e09d77967b66129c4942eee6d3eaf4a0ce2a841acc873a46ae35e40f0088288d038857c70a1415300544d7cf376949a372049679afa35ee5206b58266184";
        let pvk = groth16::prepare_verifying_key(&groth16::bn254(), &verify_key);
        let proof = groth16::proof_points_from_bytes(proof_bytes);
        let inputs = groth16::public_proof_inputs_from_bytes(input_bytes);
        groth16::verify_groth16_proof(&groth16::bn254(), &pvk, &inputs, &proof)
    }

    public fun setupTable(ctx: &mut TxContext) {
        let string: String = utf8(b"google");
        let image_link = sui::url::new_unsafe(string.to_ascii());
            
        let suimonTable = vector<SuimonType>[
            SuimonType { number: 1, name: utf8(b"Suimon"), description: utf8(b"A cute little creature"),
            image: image_link, rarity: 1,
            fusion_partners: vector<u64>[],
            fusion_target: 0},
            SuimonType { number: 2, name: utf8(b"Suimon"), description: utf8(b"A cute little creature"),
            image: image_link, rarity: 1,
            fusion_partners: vector<u64>[],
            fusion_target: 0},
            SuimonType { number: 3, name: utf8(b"Suimon"), description: utf8(b"A cute little creature"),
            image: image_link, rarity: 1,
            fusion_partners: vector<u64>[],
            fusion_target: 0},
            SuimonType { number: 4, name: utf8(b"Suimon"), description: utf8(b"A cute little creature"),
            image: image_link, rarity: 1,
            fusion_partners: vector<u64>[],
            fusion_target: 0},
        ];

        let table = SuimonTable {
            id: object::new(ctx),
            table: suimonTable,
        };

        transfer::public_freeze_object(table)
    }
    public fun check_max_per_epoch(clock: &Clock, ctx: &mut TxContext):bool{
        //checks that the max mint per epoch is not exceeded
        //86400000.0 is 24 hours in milliseconds
        //epoch changes every 12 hours
        let epoch_start_timestamp_ms = tx_context::epoch_timestamp_ms(ctx);
        // let current_epoch = tx_context::epoch(ctx);
        let current_time_ms = clock::timestamp_ms(clock);
        (current_time_ms - epoch_start_timestamp_ms) > 43200000
    }
    
    entry fun mint(clock: &Clock, epoch: &mut Epoch, suimonTable: &SuimonTable, r: &Random, monId: u64, proof: vector<u8>, nonce: u64, ctx: &mut TxContext) {
        let table = suimonTable.table;
        if (monId < vector::length(&table)) {
            if (check_max_per_epoch(clock, ctx)) {
            let suimonType = *vector::borrow(&table, monId);
            //check proof
            if(check_proof(monId, clock, epoch, proof,nonce, r, ctx )){
                let suimon = Suimon {
                    id: object::new(ctx),
                    number: suimonType.number,
                    name: suimonType.name,
                    description: suimonType.description,
                    image: suimonType.image,
                    max_mint_per_epoch: 10,
                    rarity: suimonType.rarity,
                };
                transfer::public_transfer(suimon, tx_context::sender(ctx));

                epoch.mints = epoch.mints + 1;
            }
        }
    }
    }
    public fun evolve(fusionP1: Suimon, fusionP2: Suimon, suimonTable: &SuimonTable, ctx: &mut TxContext){
        let table = suimonTable.table;
        let targetMetaData = *vector::borrow(&table, fusionP1.number);
        let fusion_target = targetMetaData.fusion_target;
        let fusion_partners = targetMetaData.fusion_partners;
        //call mint on each fusion partner
        let mut i = 0;
        let len = vector::length(&fusion_partners);
        while (i < len) {
            let partner = vector::borrow(&fusion_partners, i);
            // burn(partner,proof, ctx);
            i = i + 1;
        };
        burn(fusionP1, ctx);
        burn(fusionP2, ctx);
        // TODO call mint on fusion target
        // mint(fusion_target, ctx);
    }
    fun battle(r: &Random , bp: &mut BattleParties, ctx: &mut TxContext){
        let mut generator = random::new_generator(r,ctx );
        let mon1 = bp.monID1.extract();
        let mon2 = bp.monID2.extract();
        let rarity1 = mon1.rarity;
        let rarity2 = mon2.rarity;
        let total_weight = rarity1 + rarity2; //(this should be the difficulties insteadd..)
        let random_number = random::generate_u8_in_range(&mut generator, 1, total_weight);
        if (random_number < rarity1) {
            transfer::public_transfer(mon1, bp.owner1);
            transfer::public_transfer(mon2, bp.owner1);
        } else {
            transfer::public_transfer(mon1, bp.owner2);
            transfer::public_transfer(mon2, bp.owner2);
        }
    }
    public fun free(monID: u64,ctx: &mut TxContext){
    }
    entry fun ready_to_battle(clock: &Clock,battleParties:&mut BattleParties,suimon: Suimon, random: &Random, ctx: &mut TxContext){
        if (option::is_none(&battleParties.monID1)) {
            battleParties.monID1.fill(suimon);
            battleParties.owner1 = ctx.sender();
        } else {
            battleParties.monID2.fill(suimon);
            battleParties.owner2 = ctx.sender();
            battle(random, battleParties, ctx);
            battleParties.owner1 = @0x0;
            battleParties.owner2 = @0x0;
        };
    }
    public fun transfer (suimon: Suimon, recipient: address, ctx: &mut TxContext){
        transfer::transfer(suimon, recipient);
    }
    public fun name(suimon: &Suimon): String {
        suimon.name
    }
    public fun description(suimon: &Suimon): String {
        suimon.description
    }
    public fun image(suimon: &Suimon): Url {
        suimon.image
    }
    public entry fun burn(suimon: Suimon, ctx: &mut TxContext) {
        let Suimon { id, .. } = suimon;
        object::delete(id);
    }
     #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(ctx)
    }
//     // public fun evolve(mut user_collection: vector<UID>): vector<sui::object::UID>  {
//     //     let mut iter: u64 = 0;
//     //     let length = std::vector::length(&user_collection);
//     //     while (iter < length) {
//     //         let nft = user_collection.pop_back();
//     //         //burn(nft);
//     //         iter = iter + 1;
//     //     }
//     // }
     #[test_only]
     public fun test_endian (ctx: &mut TxContext) {

        let u64_value: u64 = 42;
        let bytes: vector<u8> = bcs::to_bytes(&u64_value);

     }
         
}
