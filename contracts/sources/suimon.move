module suimon::suimon {
    // Part 1: These imports are provided by default
    use std::string::{Self, String, utf8};
    use sui::table;
    use sui::groth16;
    use sui::random::{Self, Random};
    use sui::package::{Self, Publisher};
    use std::debug;
    use sui::url::{Self, Url};
    use sui::clock::{Self, Clock};
    use 0x1::bcs;
    use std::vector;

    public struct Suimon has key, store {
        id: UID, // object ID
        number: u64, // internal id
        name: String, // Suimon name
        description: String, // Suimon description
        url: Url, // Suimon sprite
        max_mint_per_epoch: u64, // Max amount of mints per epoch
        rarity: u8,
    }
    // SuimonType is the metadata of a Suimon
    public struct SuimonType has copy, drop, store {
        number: u64,
        name: String,
        description: String,
        url: Url,
        rarity: u8,
        max_mint_per_epoch: u64,
        fusion_partner: u64,
        fusion_target: u64,
    }
    // SuimonTable is a table of SuimonTypes
    public struct SuimonTable has key, store {
        id: UID,
        table: vector<SuimonType>
    }
    // Epoch is a struct that holds the current epoch information
    public struct Epoch has key, store {
        id: UID,
        seed: u64,
        timestamp: u64,
        mints: u64,
    }
    // BattleParties is a struct that holds the information of the two parties in a battle
    public struct BattleParties has key, store {
        id: UID,
        monID1: Option<Suimon>,
        monID2: Option<Suimon>,
        owner1: address,
        owner2: address,
    }

  

    fun init(ctx: &mut TxContext) {
        let battleParties = BattleParties {
            id: object::new(ctx),
            monID1: option::none(),
            monID2: option::none(),
            owner1: @0x0,
            owner2: @0x0,
        };
        let epoch = Epoch {
            id: object::new(ctx),
            seed: 0,
            timestamp: 0,
            mints: 0,
        };
        transfer::public_share_object(epoch);
        setupMonTable(ctx);
        transfer::public_share_object(battleParties);
    }

    fun check_proof(
        monId: u64,
        clock: &Clock,
        epoch: &mut Epoch,
        _proof_bytes: vector<u8>,
        nonce: u64,
        r: &Random,
        ctx: &mut TxContext
    ): bool {
        let mut generator = random::new_generator(r, ctx);
        let seed;
        if (epoch.timestamp + 86400000 < clock::timestamp_ms(clock)) {
            seed = epoch.seed;
        } else {
            seed = random::generate_u64(&mut generator);
            epoch.seed = seed;
        };
        let nonce_bytes = bcs::to_bytes(&nonce);
        let monId_bytes = bcs::to_bytes(&monId);
        let seed_bytes = bcs::to_bytes(&seed);
        let input_bytes = x"0100000001000000000000000000000000000000000000000000000000000000";
        let verify_key = x"94d781ec65145ed90beca1859d5f38ec4d1e30d4123424bb7b0c6fc618257b1551af0374b50e5da874ed3abbc80822e4378fdef9e72c423a66095361dacad8243d1a043fc217ea306d7c3dcab877be5f03502c824833fc4301ef8b712711c49ebd491d7424efffd121baf85244404bded1fe26bdf6ef5962a3361cef3ed1661d897d6654c60dca3d648ce82fa91dc737f35aa798fb52118bb20fd9ee1f84a7aabef505258940dc3bc9de41472e20634f311e5b6f7a17d82f2f2fcec06553f71e5cd295f9155e0f93cb7ed6f212d0ccddb01ebe7dd924c97a3f1fc9d03a9eb915020000000000000072548cb052d61ed254de62618c797853ad3b8a96c60141c2bfc12236638f1b0faf9ecf024817d8964c4b2fed6537bcd70600a85cdec0ca4b0435788dbffd81ab";
        let proof_bytes = x"212d4457550f258654a24a6871522797ab262dee4d7d1f89af7da90dc0904eac57ce183e6f7caca9a98755904c1398ff6288cec9877f98f2d3c776c448b9ad166839e09d77967b66129c4942eee6d3eaf4a0ce2a841acc873a46ae35e40f0088288d038857c70a1415300544d7cf376949a372049679afa35ee5206b58266184";
        let pvk = groth16::prepare_verifying_key(&groth16::bn254(), &verify_key);
        let proof = groth16::proof_points_from_bytes(proof_bytes);
        let inputs = groth16::public_proof_inputs_from_bytes(input_bytes);
        groth16::verify_groth16_proof(
            &groth16::bn254(),
            &pvk,
            &inputs,
            &proof
        )
    }

    entry fun createEpoch(ctx: &mut TxContext) {
        let epoch = Epoch {
            id: object::new(ctx),
            seed: 0,
            timestamp: 0,
            mints: 0,
        };
        transfer::share_object(epoch);
    }

    public fun setupMonTable(ctx: &mut TxContext) {
        let string: String = utf8(b"google");
        let image_link = sui::url::new_unsafe(string.to_ascii());

        let suimonTable = vector<SuimonType>[
            SuimonType {
                number: 0,
                name: utf8(b"Capy"),
                description: utf8(
                    b"Loves to swim and play in water. It is very social and often found in groups. Capy is known for its calm and friendly nature."
                ),
                url: sui::url::new_unsafe(  
                    utf8(b"https://imgur.com/jxIXCSs").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 14,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 1,
                name: utf8(b"Suimander"),
                description: utf8(
                    b"Its long body burns with a bright flame. Suimander is agile and quick. It can withstand high temperatures and loves basking in the sun or bathing in magma."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/kzXfKYw").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 14,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 2,
                name: utf8(b"Chickpea"),
                description: utf8(
                    b"It loves sprinting rapidly through grass fields in sunlight. Chickpea is resilient and can thrive in various environments. It has a vibrant green plumage that attracts the bugs that it eats."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/BU03t7L").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 12,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 3,
                name: utf8(b"Suiqer"),
                description: utf8(
                    b"Excellent at diving and catching fish. Suiqer is playful and enjoys splashing around. It has a keen sense of direction and rarely gets lost, alerting its mother to its location with a distinctive squeak if it ever does."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/eesVexI").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 12,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 4,
                name: utf8(b"Embermoth"),
                description: utf8(
                    b"Its wings glow with fiery patterns. Embermoth is nocturnal and is attracted to light. It can ignite its fur to ward off predators."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/K7UowwF").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 12,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 5,
                name: utf8(b"Starporcupine"),
                description: utf8(
                    b"Its quills are as hard as rocks. Starporcupine is very defensive and uses its quills to protect itself. It can roll into a ball to move quickly."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/ZpN0I6I").to_ascii()
                ),
                rarity: 3,
                fusion_partner: 1,
                fusion_target: 0,
                max_mint_per_epoch: 250000,
            },
            SuimonType {
                number: 6,
                name: utf8(b"Finflopper"),
                description: utf8(
                    b"Finflopper is known for its playful nature. It can jump out of water to catch insects but often gets stuck on land. When out of its element, it flops around energetically, unable to move until it finds water again."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/AQIulVm").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 13,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 7,
                name: utf8(b"Sprouthen"),
                description: utf8(
                    b"It grows large broad leaves that can slap enemies with surprising force. Sprouthen is very resilient and can regrow its leaves quickly. It thrives in sunny environments."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/mII4Hqn").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 15,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 8,
                name: utf8(b"Grasshopper"),
                description: utf8(
                    b"Grasshopper is very agile and can evade attacks easily. It feeds on leaves and plants, but enjoys hunting other Suimon for the thrill of the chase."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/lgx6CCd").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 0,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 9,
                name: utf8(b"Buzzbee"),
                description: utf8(
                    b"It collects nectar to make honey. Buzzbee is very industrious and works tirelessly. It has a strong sense of community and protects its hive."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/s4lJGPO").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 18,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 10,
                name: utf8(b"Flickerwing"),
                description: utf8(
                    b"Its wings flicker with dazzling light that absorbs luminescence from light sources. Flickerwing is very delicate and shy in nature, preferring to be solitary as long is it has a heat source nearby."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/9MmFw4c").to_ascii()
                ),
                rarity: 3,
                fusion_partner: 1,
                fusion_target: 16,
                max_mint_per_epoch: 250000,
            },
            SuimonType {
                number: 11,
                name: utf8(b"Quitten"),
                description: utf8(
                    b"Its whiskers can sense vibrations in the ground. Quitten is very curious and agile. It can dig small holes to hide or find food."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/WLp8Iei").to_ascii()
                ),
                rarity: 1,
                fusion_partner: 1,
                fusion_target: 16,
                max_mint_per_epoch: 1000000,
            },
            SuimonType {
                number: 12,
                name: utf8(b"Sui Snake"),
                description: utf8(
                    b"It can move swiftly in water and on land. Sui Snake is very stealthy and can blend into seaweed patches as it hunts. It has a venomous bite that can paralyze its prey."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/BNQnpZW").to_ascii()
                ),
                rarity: 4,

                fusion_partner: 1,
                fusion_target: 13,
                max_mint_per_epoch: 50000,
            },
            SuimonType {
                number: 13,
                name: utf8(b"Emberwing"),
                description: utf8(
                    b"Its wings crackle with burning energy. Emberwing is very fast and can create small firestorms. It is known for its fierce and aggressive nature."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/dIhDRUD").to_ascii()
                ),
                rarity: 4,
                fusion_partner: 1,
                fusion_target: 15,
                max_mint_per_epoch: 50000,
            },
            SuimonType {
                number: 14,
                name: utf8(b"Drago Sui"),
                description: utf8(
                    b"It has immense power and wisdom. Drago Sui is revered by many for its strength. It can create powerful tremors and cause eruptions, but usually spends its time sleeping in active volcanos."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/4i6ZLpF").to_ascii()
                ),
                rarity: 4,
                fusion_partner: 1,
                fusion_target: 16,
                max_mint_per_epoch: 50000,
            },
            SuimonType {
                number: 15,
                name: utf8(b"Terraquill"),
                description: utf8(
                    b"It can dig massive ravines around its opponents to attack. Terraquill's tail is very sturdy and can withstand great force. It uses the densely packed quill-like fur on its tail to sense tremors and protect its back as it digs."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/Vp1eY8X").to_ascii()
                ),
                rarity: 3,
                fusion_partner: 1,
                fusion_target: 18,
                max_mint_per_epoch: 250000,
            },
            SuimonType {
                number: 16,
                name: utf8(b"Florapin"),
                description: utf8(
                    b"Florapin is revered for its regenerative abilities and the vibrant flowers that bloom from its back. Its very presence nourishes the soil around it, allowing life to thrive wherever it goes."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/0qEOPdk").to_ascii()
                ),
                rarity: 5,
                fusion_partner: 1,
                fusion_target: 18,
                max_mint_per_epoch: 5000,
            },
            SuimonType {
                number: 17,
                name: utf8(b"Floraking"),
                description: utf8(
                    b"It commands the flora and fauna, even the most wild of beasts submitting to its rule. Floraking is very wise and respected by all. It can create lush forests and fertile lands wherever it goes."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/jZ6TjjN").to_ascii()
                ),
                rarity: 5,
                fusion_partner: 1,
                fusion_target: 18,
                max_mint_per_epoch: 5000,
            },
            SuimonType {
                number: 18,
                name: utf8(b"Finlord"),
                description: utf8(
                    b"With origins as a small guppy, it rules the oceans benevolently despite its titanic form. Finlord is very powerful and can create massive waves. It is revered by all sea creatures and commands respect."
                ),
                url: sui::url::new_unsafe(
                    utf8(b"https://imgur.com/9IgHWps").to_ascii()
                ),
                rarity: 5,
                fusion_partner: 1,
                fusion_target: 18,
                max_mint_per_epoch: 5000,
            },

        ];

        let table = SuimonTable {
            id: object::new(ctx),
            table: suimonTable,
        };

        transfer::freeze_object(table)

    }

    entry fun mint(
        clock: &Clock,
        epoch: &mut Epoch,
        suimonTable: &SuimonTable,
        r: &Random,
        monId: u64,
        proof: vector<u8>,
        nonce: u64,
        ctx: &mut TxContext
    ) {
        let table = suimonTable.table;
        if (monId < vector::length(&table)) {
            let suimonType = *vector::borrow(&table, monId);
            let max_mint_per_epoch = suimonType.max_mint_per_epoch;
            assert!(epoch.mints < max_mint_per_epoch);
            //check proof
            if (check_proof(
                    monId,
                    clock,
                    epoch,
                    proof,
                    nonce,
                    r,
                    ctx
                )) {
                let suimon = Suimon {
                    id: object::new(ctx),
                    number: suimonType.number,
                    name: suimonType.name,
                    description: suimonType.description,
                    url: suimonType.url,
                    max_mint_per_epoch: 10,
                    rarity: suimonType.rarity,
                };
                transfer::public_transfer(suimon, tx_context::sender(ctx));
                epoch.mints = epoch.mints + 1;
                }
            }
    }
    

    public fun evolve(
        fusionP1: &mut Suimon,
        fusionP2: Suimon,
        suimonTable: &SuimonTable,
        _ctx: &mut TxContext
    ) {
        assert!(fusionP1.rarity == fusionP2.rarity);
        fusionP1.rarity = fusionP1.rarity + 1;
        let table = suimonTable.table;
        let targetMetaData = *vector::borrow(&table, fusionP1.number);
        let fusion_target = targetMetaData.fusion_target;
        let fusion_partner = targetMetaData.fusion_partner;
        assert!(fusion_partner == fusionP2.number);
        let upgradeMetaData = *vector::borrow(&table, fusion_target);

        fusionP1.number = upgradeMetaData.number;
        fusionP1.name = upgradeMetaData.name;
        fusionP1.description = upgradeMetaData.description;
        fusionP1.url = upgradeMetaData.url;
        fusionP1.max_mint_per_epoch = upgradeMetaData.max_mint_per_epoch;
        fusionP1.rarity = upgradeMetaData.rarity;

        burn(fusionP2);

    }

    fun battle(
        r: &Random,
        bp: &mut BattleParties,
        ctx: &mut TxContext
    ) {
        let mut generator = random::new_generator(r, ctx);
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

    entry fun ready_to_battle(
        battleParties: &mut BattleParties,
        suimon: Suimon,
        random: &Random,
        ctx: &mut TxContext
    ) {
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

    public fun transfer(suimon: Suimon, recipient: address) {
        transfer::transfer(suimon, recipient);
    }

    public fun name(suimon: &Suimon): String {
        suimon.name
    }

    public fun description(suimon: &Suimon): String {
        suimon.description
    }

    public fun url(suimon: &Suimon): Url {
        suimon.url
    }

    public entry fun burn(suimon: Suimon) {
        let Suimon {id,..} = suimon;
        object::delete(id);
    }

    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(ctx)
    }
}
