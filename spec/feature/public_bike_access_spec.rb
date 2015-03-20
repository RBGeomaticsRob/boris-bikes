require 'capybara/rspec'
require 'docking_station'

feature 'member of public can release a bike' do
  let(:docking_station) { DockingStation.new }
  scenario 'the docking station releases a working bike' do
    docking_station.dock(Bike.new)
    bike = docking_station.release_bike
    expect(bike).not_to be_broken
  end
  scenario 'if the docking station is empty a bike is not released' do
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
  scenario 'the docking station will not release a broken bike' do
    broken_bike = Bike.new
    broken_bike.break
    docking_station.dock broken_bike
    expect { docking_station.release_bike }.to raise_error 'No Bikes Available'
  end
end
