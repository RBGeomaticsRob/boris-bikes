require 'van'

describe Van do
  it 'raises an error when loading to a full van' do
    Van::DEFAULT_CAPACITY.times { subject.load(double(:bike)) }
    expect { subject.load(double(:bike)) }.to raise_error 'Van Full'
  end
  it 'raises an error when trying to release a bike from an empty van' do
    expect { subject.release_bike }.to raise_error 'Van Empty'
  end
  it 'releases a broken bike to a garage' do
    broken_bike = double(:bike, broken?: true)
    subject.load broken_bike
    expect(subject.release_broken).to be_broken
  end
end
