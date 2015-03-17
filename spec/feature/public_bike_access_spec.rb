require 'capybara/rspec'

feature 'member of public accesses bike' do
  scenario 'docking station releases a bike that is not broken' do
    docking_station = DockingStation.new
    bike = docking_station.releases_bike
    expect(bike).not_to be_broken
end