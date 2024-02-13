extern crate mm;

#[test]
fn select_test() {
    assert_eq!(2, mm::select(2, 0));
}