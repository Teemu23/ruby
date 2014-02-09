require 'spec_helper'

include OwnTestHelper

describe "Users page" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"Iso 3", brewery:brewery }
  let!(:user) {FactoryGirl.create :user }
  let!(:user2) {FactoryGirl.create :user2}
  let!(:rating) {FactoryGirl.create :rating, score:"17", beer:beer1, user:user2 }
  let!(:rating1) {FactoryGirl.create :rating, score:"20", beer:beer1, user:user }
  let!(:rating2) { FactoryGirl.create :rating, score:"15", beer:beer1, user:user }


  it "shows ratings correctly" do
    sign_in(username:"Pekka", password:"Foobar1")

    expect(page).to have_content "has made 2 rating"
    expect(page).to have_content "Iso 3"
    expect(page).not_to have_content "17"

    expect(page).not_to have_content "Timo"
  end


  it "deleting own rating works" do
    sign_in(username:"Pekka", password:"Foobar1")
    expect(page).to have_content "has made 2 rating"
    page.first(:link, "delete").click
    expect(page).to have_content "has made 1 rating"

  end

end