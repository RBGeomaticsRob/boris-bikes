require 'capybara/rspec'
require 'docking_station'

feature 'maintainance modifies the system' do
  scenario 'by increasing capacity' do
    bigger = DockingStation::DEFAULT_CAPACITY + 10
    docking_station = DockingStation.new(bigger)
    expect(docking_station.capacity).to eq bigger
  end
  scenario 'vans can release broken bikes from docking station to be fixed' do
    docking_station = DockingStation.new
    broken_bike = Bike.new
    broken_bike.break
    docking_station.dock(broken_bike)
    expect(docking_station.release_broken).to be_broken
  end
  scenario 'if there are no broken bikes for van a bike is not released' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect { docking_station.release_broken }.to raise_error 'No Broken Bikes'
  end
  scenario 'vans can return fixed bikes to docking station' do
    van = Van.new
    van.load(Bike.new)
    expect(van.release_bike).not_to be_broken
  end
  scenario 'garages can fix broken bikes'
end
