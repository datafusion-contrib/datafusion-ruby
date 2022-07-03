use magnus::{define_class, function, prelude::*, Error};

mod context;

#[magnus::init]
fn init() -> Result<(), Error> {
    let class = define_class("SessionContext", Default::default())?;
    class.define_singleton_method("new", function!(context::RbSessionContext::new, 0))?;
    Ok(())
}
