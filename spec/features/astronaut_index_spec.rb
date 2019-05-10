require 'rails_helper'

describe 'As a visitor on the astronaut index page' do
  before(:each) do
    @astronaut_1 = Astronaut.create!(name: "Buzz", age: 62, job: "Gangster")
    @astronaut_2 = Astronaut.create!(name: "Neil", age: 64, job: "Human Relations")
    @astronauts = Astronaut.all

    @mission_1 = @astronaut_1.missions.create!(title: "apollo 12", time_in_space: 35)
    @mission_2 = @astronaut_1.missions.create!(title: "apollo 11", time_in_space: 25)
    @mission_3 = @astronaut_2.missions.create!(title: "apollo 10", time_in_space: 15)

    @astronaut_3 = @mission_3.astronauts.create(name: "Sally", age: 44, job: "The Brains")

  end
  
  it 'should show each astronaut age, name, and job' do
    visit astronauts_path

    within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_1.job)
    end

    within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.age)
        expect(page).to have_content(@astronaut_2.job)
    end
  end

  it 'should show the average age of all astronauts' do
    visit astronauts_path

    expect(page).to have_content("Average Age: #{@astronauts.average_age.to_i}")
  end

  it 'should show a list of all missions sorted alphabetically for each astronaut' do
    visit astronauts_path 

    within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content(@mission_1.title)
        expect(page).to have_content(@mission_1.time_in_space)
        
        expect(page).to have_content(@mission_1.title)
        expect(page).to have_content(@mission_1.time_in_space)
        expect(page).to have_content(@astronaut_1.total_space_time)
    end

    within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content(@mission_3.title)
        expect(page).to have_content(@mission_3.time_in_space)
        expect(page).to have_content(@astronaut_2.total_space_time)

    end

    within "#astronaut-#{@astronaut_3.id}" do
        expect(page).to have_content(@mission_3.title)
        expect(page).to have_content(@mission_3.time_in_space)
        expect(page).to have_content(@astronaut_3.total_space_time)

    end


  end
end