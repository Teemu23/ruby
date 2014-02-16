require 'spec_helper'

describe "Ratings page" do
	let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:style) { FactoryGirl.create :style, style:"Ale", description:"asd" }
  	let!(:beer1) { FactoryGirl.create :beer, name:"Iso 3", brewery:brewery, style:style }
  	let!(:user) {FactoryGirl.create :user }
  	let!(:rating) { FactoryGirl.create :rating, score:"15", beer:beer1, user:user }
  	
  	it "shows ratings correctly" do
  		visit ratings_path

  		expect(page).to have_content "Number of ratings #{Rating.count}"
  		expect(page).to have_content "Iso 3"
  	end

end
	