require 'spec_helper'

feature "submit a new Manufacturer", %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types
    of cars found in the lot
  } do

  # Acceptance Criteria:
  # * I must specify a manufacturer name and country.
  # * If I do not specify the required information, I am
  #   presented with errors.
  # * If I specify the required information, the
  #   manufacturer is recorded and I am redirected
  #   to enter another new manufacturer.

  scenario 'a user submits a valid manufacturer' do
    visit new_manufacturer_path

    fill_in "Name", with: "Toyota"
    fill_in "Country", with: "Japan"

    click_button 'Add Manufacturer'
    # expect(page).to have_content 'Manufacturer successfully added!'
    expect(Manufacturer.count).to eq(1)
  end

  scenario 'a user submits an invalid Manufacturer' do
    visit new_manufacturer_path

    click_button 'Add Manufacturer'
    expect(Manufacturer.count).to eq(0)
  end

end
