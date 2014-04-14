require 'spec_helper'

feature "submit a new car", %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do

  # Acceptance Criteria:
  # * I must specify the color, year, and mileage of the car.
  # * Only years from 1980 and above can be specified.
  # * I can optionally specify a description of the car.
  # * If I enter all of the required information in the required formats, the car is recorded.
  # * If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # * Upon successfully creating a car, I am redirected so that I can create another car.

  scenario 'a user submits a valid car' do
    visit new_car_path

    fill_in 'Color', with: 'Red'
    select '1992', from: 'Year'
    fill_in 'Mileage', with: '200000'
    fill_in 'Description', with: 'Nice car.'

    click_button 'Add Car'
    # expect(page).to have_content 'Car successfully added!'
    expect(Car.count).to eq(1)
  end

  scenario 'a user submits an invalid car' do
    visit new_car_path

    click_button 'Add Car'
    expect(Car.count).to eq(0)
  end

end
