require "datafusion"

RSpec.describe "SessionContext" do
  describe "#new" do
    it "returns a SessionContext" do
      ctx = Datafusion::SessionContext.new
      expect(ctx.is_a?(Datafusion::SessionContext)).to eq true
    end
  end
end
