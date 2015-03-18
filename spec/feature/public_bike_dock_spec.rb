require 'capybara/rspec'
require 'docking_station'

feature 'member of the public docks bike' do
  scenario 'docking station unable to recieve as full' do
    docking_station = DockingStation.new

    docking_station.capacity.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
end
