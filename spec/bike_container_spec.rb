require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe ContainerHolder do
  # let(:holder) { ContainerHolder.new }
  let(:nbike) { Bike.new }

  it 'should accept a bike' do
    expect(subject.bikes.count).to eq(0)
    subject.dock(nbike)
    expect(subject.bikes.count).to eq(1)
  end
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
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises an error when docking to a full station' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error 'Station Full'
  end
  it 'can receive a specific capacity' do
    allow(subject).to receive(:bigger)
  end
  it 'can be increased in capacity' do
    bigger = { capacity: DockingStation::DEFAULT_CAPACITY + 10 }
    docking_station = DockingStation.new(bigger)
    expect(docking_station.capacity).to eq bigger[:capacity]
  end
  it 'does not release a broken bike' do
    broken_bike = double(:bike, broken?: true)
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'releases a broken bike to van' do
    broken_bike = double(:bike, broken?: true)
    subject.dock broken_bike
    expect(subject.release_broken).to be_broken
  end
  it 'does not release a working bike to van' do
    subject.dock double(:bike, broken?: false)
    expect { subject.release_broken }.to raise_error 'No Broken Bikes'
  end
end
