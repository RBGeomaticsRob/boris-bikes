require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases bikes that are not broken' do
    subject.dock double(:bike, broken?: false)
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end

  it 'can dock a bike' do
    expect(subject.dock(:bike)).to eq :bike
  end
end
