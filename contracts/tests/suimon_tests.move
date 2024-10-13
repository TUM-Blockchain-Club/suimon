#[test_only]
module suimon::suimon_tests {
    use std::debug;
    use sui::test_scenario;
    use suimon::suimon;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_suimon_init() {
        let addr1 = @0xA;
        let addr2 = @0xB;
        let mut ts = test_scenario::begin(addr1);

        suimon::test_init(ts.ctx());

        debug::print(&std::string::utf8(b"test_init"));

        test_scenario::next_tx(&mut ts, addr2);

        let table : suimon::SuimonTable = test_scenario::take_immutable(&ts);

        debug::print(&table);

        test_scenario::return_immutable(table);
        test_scenario::end(ts);
    }

    #[test]
    fun test_proof() {
        assert!(suimon::check_proof())
    }

    #[test, expected_failure(abort_code = ::suimon::suimon_tests::ENotImplemented)]
    fun test_suimon_fail() {
        abort ENotImplemented
    }


}
