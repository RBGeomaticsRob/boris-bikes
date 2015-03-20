require './lib/docking_station'

describe DockingStation do
  subject { described_class.new(capacity: 123) }
  it 'can set a capacity on initialising' do
    expect(subject.capacity).to eq(123)
  end
end
