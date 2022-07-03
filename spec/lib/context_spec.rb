require "datafusion"

RSpec.describe "SessionContext" do
  describe "#new" do
    it "returns a SessionContext" do
      ctx = SessionContext.new
      expect(ctx.is_a?(SessionContext)).to eq true
    end
  end
end
