extern crate rand;

pub trait UserInterface {}

pub struct User {
    id: String,
    username: String,
    password: String,
    email: String,
    isAuthenticated: bool,
}

impl User {
    fn generateId() {}

    fn hashPassword() {}

    fn authenticate() {}
}

fn main() {
    let n: f32 = 0.1 + 0.2;
    println!("{:?}", n);
}
