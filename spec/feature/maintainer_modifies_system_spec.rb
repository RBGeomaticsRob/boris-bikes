require 'capybara/rspec'
require 'docking_station'

feature 'maintainance modifies the system' do
  scenario 'by increasing capacity' do
    bigger = DockingStation::DEFAULT_CAPACITY + 10
    docking_station = DockingStation.new(bigger)
    expect(docking_station.capacity).to eq bigger
  end
end
