require 'van'

describe Van do
  it 'raises an error when loading to a full van' do
    Van::DEFAULT_CAPACITY.times { subject.load(double(:bike)) }
    expect { subject.load(double(:bike)) }.to raise_error 'Van Full'
  end
end
