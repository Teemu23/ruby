require 'spec_helper'

describe Beer do
  it "with name and style" do
  	beer = Beer.create name:"Olut", style:"Lager"

  	expect(beer).to be_valid
  	expect(Beer.count).to eq(1)
  end

  it "with no name" do
  	beer = Beer.new style:"Lager"

  	expect(beer).not_to be_valid
  	expect(Beer.count).to eq(0)
  end

  it "with no style" do
  	beer = Beer.new name:"SuperLager"

  	expect(beer).not_to be_valid
  	expect(Beer.count).to eq(0)
  end
end
