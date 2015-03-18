require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'releases bikes that are not broken' do
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'can dock a bike' do
    expect(subject.dock :bike).to be nil
  end
  it 'raises an error when no bikes are available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises an error when full at capacity 30' do
    docking_station = DockingStation.new(30)
    docking_station.capacity.times { docking_station.dock double :bike }
    expect { docking_station.dock double :bike }.to raise_error 'Station Full'
  end
  it 'raises an error at default size' do
    docking_station = DockingStation.new
    docking_station.capacity.times { docking_station.dock double :bike }
    expect { docking_station.dock double :bike }.to raise_error 'Station Full'
  end
end
