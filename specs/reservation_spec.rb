require_relative 'spec_helper'

describe "Reservation Class" do
  describe "#initialize" do
    it "can be created" do
      result = Hotel::Reservation.new
      result.must_be_kind_of Hotel::Reservation
    end
  end # initialize


end # Reservation Class
