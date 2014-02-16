require 'spec_helper'

describe Beer do
  it "with name" do
  	beer = Beer.create name:"Olut"

  	expect(beer).to be_valid
  	expect(Beer.count).to eq(1)
  end

  it "with no name" do
  	beer = Beer.new

  	expect(beer).not_to be_valid
  	expect(Beer.count).to eq(0)
  end

end
