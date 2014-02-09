require 'spec_helper'

describe "Ratings page" do
	let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  	let!(:beer1) { FactoryGirl.create :beer, name:"Iso 3", brewery:brewery }
  	let!(:user) {FactoryGirl.create :user }
  	let!(:rating) { FactoryGirl.create :rating, score:"15", beer:beer1, user:user }
  	
  	it "shows ratings correctly" do
  		visit ratings_path

  		expect(page).to have_content "Number of ratings #{Rating.count}"
  		expect(page).to have_content "Iso 3"
  	end

  	it "deleting own rating works" do
  		
  	end
end
	