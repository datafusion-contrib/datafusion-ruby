use magnus::{define_module, function, prelude::*, Error};

mod context;

#[magnus::init]
fn init() -> Result<(), Error> {
    let module = define_module("Datafusion")?;
    let class = module.define_class("SessionContext", Default::default())?;
    class.define_singleton_method("new", function!(context::RbSessionContext::new, 0))?;
    Ok(())
}
