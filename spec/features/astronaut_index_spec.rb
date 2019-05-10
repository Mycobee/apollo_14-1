require 'rails_helper'

describe 'As a visitor on the astronaut index page' do
  before(:each) do
    @astronaut_1 = Astronaut.create!(name: "Buzz", age: 62, job: "Gangster")
    @astronaut_2 = Astronaut.create!(name: "Neil", age: 64, job: "Human Relations")
    @astronauts = Astronaut.all
  end
  
  it 'should show each astronaut age, name, and job' do
    visit astronauts_path

    expect(page).to have_content(@astronaut_1.name)
    expect(page).to have_content(@astronaut_1.age)
    expect(page).to have_content(@astronaut_1.job)

    expect(page).to have_content(@astronaut_2.name)
    expect(page).to have_content(@astronaut_2.age)
    expect(page).to have_content(@astronaut_2.job)
  end

  it 'should show the average age of all astronauts' do
    visit astronauts_path

    expect(page).to have_content("Average Age: #{@astronauts.average_age.to_i}")
  end
end