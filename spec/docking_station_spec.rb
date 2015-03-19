require 'docking_station'
describe DockingStation do
  it 'docking station releases a bike' do
    expect(subject).to respond_to :release_bike
  end
  it 'release a working bike' do
    subject.dock(double(:bike, broken?: false))
    fake_bike = subject.release_bike
    expect(fake_bike).not_to be_broken
  end
  it 'docks a bike' do
    expect(subject.dock(:bike)).to be nil
  end
  it 'raises an error when no bikes avaialable' do
    expect { subject.release_bike }.to raise_error 'No Bikes'
  end
  it 'raises an error when docking station is full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error 'Station Full'
  end
  it 'receives a specific capacity' do
    allow(subject).to receive(:bigger)
  end
  it 'increase capacity' do
    bigger = DockingStation::DEFAULT_CAPACITY + 10
    docking_station = DockingStation.new(bigger)
    expect(docking_station.capacity).to eq bigger
  end
  it 'do not release a broke bike' do
    broken_bike = double(:bike, broken?: true)
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No Bikes'
  end
end
