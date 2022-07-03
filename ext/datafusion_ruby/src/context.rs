use datafusion::execution::context::SessionContext;

#[magnus::wrap(class = "Datafusion::SessionContext")]
pub(crate) struct RbSessionContext {
    ctx: SessionContext,
}

impl RbSessionContext {
    pub(crate) fn new() -> Self {
        Self {
            ctx: SessionContext::new(),
        }
    }
}
