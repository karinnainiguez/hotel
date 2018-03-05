require_relative 'spec_helper'

describe "Block Class" do
  describe "#initialize" do
    it "can be created" do
      result = Hotel::Block.new
      result.must_be_kind_of Hotel::Block
    end
  end # initialize


end # Block Class
