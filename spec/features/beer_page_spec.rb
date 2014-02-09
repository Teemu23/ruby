require 'spec_helper'

include OwnTestHelper

describe "Beers page" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:user) {FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "can create new beer if name is valid" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path

    select('Weizen', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')
    fill_in('beer[name]', with:'Olut')

    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)
  end 

  it "should not create new beer with incorrect name" do
    sign_in(username:"Pekka", password:"Foobar1")

    visit new_beer_path

    select('Weizen', from:'beer[style]')
    select('Koff', from:'beer[brewery_id]')
    fill_in('beer[name]', with:'')

    expect{
      click_button "Create Beer"
    }.not_to change{Beer.count}.from(0).to(1)

    expect(page).to have_content "Name can't be blank"
  end
end