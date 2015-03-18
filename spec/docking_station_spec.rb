require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'releases bikes that are not broken' do
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'raises error if no bikes available' do
    expect { subject.release_bike }.to raise_error 'No Bikes'
  end
  it 'it can dock a bike' do
    expect(subject.dock(:bike)).to eql :bike
  end
end
