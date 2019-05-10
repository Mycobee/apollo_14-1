require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do

    it '.average_age' do
      astronaut_1 = Astronaut.create!(name: "Buzz", age: 62, job: "Gangster")
      astronaut_2 = Astronaut.create!(name: "Neil", age: 64, job: "Human Relations")
      astronauts = Astronaut.all

      expect(astronauts.average_age.to_i).to eq(63)
    end
  end
end
