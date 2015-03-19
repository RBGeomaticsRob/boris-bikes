require 'bike'
describe Bike do
  it 'bike is not broken' do
    expect(subject).not_to be_broken
  end
  it 'can break' do
    subject.break
    expect(subject).to be_broken
  end
end
