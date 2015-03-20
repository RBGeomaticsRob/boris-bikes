require 'capybara/rspec'

feature 'maintainer loads van' do
  scenario 'unable to recieve bikes as van is full' do
    van = Van.new
    Van::DEFAULT_CAPACITY.times { van.load Bike.new }
    expect { van.load Bike.new }.to raise_error 'Van Full'
  end
end
