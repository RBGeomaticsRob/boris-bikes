require 'capybara/rspec'
require 'docking_station'

feature 'member of public docks bike' do
  scenario 'unable to recieve bikes as docking stations is full' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock Bike.new }
    expect { docking_station.dock Bike.new }.to raise_error 'Station Full'
  end
end
