require 'capybara/rspec'
require 'van'

feature 'maintainer unloads van' do
  scenario 'the van releases a broken bike to a garage' do
    van = Van.new
    broken_bike = Bike.new
    broken_bike.break
    van.load(broken_bike)
    expect(van.release_broken).to be_broken
  end
  scenario 'unable to release bikes as van is empty' do
    van = Van.new
    expect { van.release_bike }.to raise_error 'Van Empty'
  end
  scenario 'the van releases a working bike to a docking station' do
    van = Van.new
    bike = Bike.new
    van.load(bike)
    expect(van.release).not_to be_broken
  end
end
