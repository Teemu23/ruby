require 'spec_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    BeermappingApi.stub(:places_in).with("kumpula").and_return(
        [ Place.new(:name => "Oljenkorsi") ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end
  it "if many are returned by the api, all are shown at the page" do
  	BeermappingApi.stub(:places_in).with("kumpula").and_return( 
  		[ Place.new(:name => "eka"), Place.new(:name => "toka")]
	)
	visit places_path
	fill_in('city', with: 'kumpula')
	click_button "Search"
  end
  it "if there are no places, No locations in <> is shown at the page" do
  	BeermappingApi.stub(:places_in).with("kumpula").and_return( 
  		[]
	)
  	visit places_path
  	fill_in('city', with: 'kumpula')
  	click_button "Search"
  	expect(page).to have_content "No locations in kumpula"

  end
end