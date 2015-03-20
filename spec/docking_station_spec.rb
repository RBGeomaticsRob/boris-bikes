require 'docking_station'
describe DockingStation do
  it 'releases a bike' do
    expect(subject).to respond_to :release_bike
  end
  it 'releases a working bike' do
    subject.dock(double(:bike, broken?: false))
    fake_bike = subject.release_bike
    expect(fake_bike).not_to be_broken
  end
  it 'docks a bike' do
    expect(subject.dock(:bike)).to be nil
  end
  it 'raises an error when trying to release a bike from an empty station' do
    expect { subject.release_bike }.to raise_error 'No Available Bikes'
  end
  it 'raises an error when docking to a full station' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error 'Station Full'
  end
  it 'can receive a specific capacity' do
    allow(subject).to receive(:bigger)
  end
  it 'can be increased in capacity' do
    bigger = DockingStation::DEFAULT_CAPACITY + 10
    docking_station = DockingStation.new(bigger)
    expect(docking_station.capacity).to eq bigger
  end
  it 'does not release a broken bike' do
    broken_bike = double(:bike, broken?: true)
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No Available Bikes'
  end
end
