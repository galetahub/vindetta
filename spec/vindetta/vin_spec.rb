require "spec_helper"

RSpec.describe Vindetta::Vin do
  describe "#each" do
    let(:vin) { create(:vin) }

    it "delegates to value.chars" do
      expect(vin.value.chars).to eq(vin.each.to_a)
    end
  end

  describe "#==" do
    let(:first_vin) { create(:vin, value: "1") }
    let(:second_vin) { create(:vin, value: "1") }

    it { expect(first_vin).to eq(second_vin) }
  end

  describe "#check_digit" do
    let(:valid_vin) { Vindetta::Vin.new("WBANU53578CT17179") }

    it "returns the check digit" do
      expect(valid_vin.check_digit).to eq("7")
    end
  end

  describe "#world_manufacturer_identity" do
    let(:vin) { create(:vin, value: "1T7HT2B2511002099") }
    let(:wmi) { create(:wmi, value: "1T7") }

    it { expect(vin.world_manufacturer_identity).to eq(wmi) }
  end

  describe "#vehicle_descriptor_section" do
    let(:vin) { create(:vin, value: "1T7HT2B2511002099") }

    it { expect(vin.vehicle_descriptor_section).to eq("HT2B2") }
  end

  describe "#model_year" do
    let(:vin) { create(:vin, value: "1T7HT2B2511002099") }

    it { expect(vin.model_year).to eq("1") }
  end

  describe "#serial_number" do
    let(:vin) { create(:vin, value: "1T7HT2B2511002099") }

    it { expect(vin.serial_number).to eq("002099") }
  end

  describe "#manufacturing_plant" do
    let(:vin) { create(:vin, value: "1T7HT2B2511002099") }

    it { expect(vin.manufacturing_plant).to eq("1") }
  end
end
