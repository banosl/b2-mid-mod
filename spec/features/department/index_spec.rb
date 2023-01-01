require 'rails_helper'

RSpec.describe "Department Index", type: :feature do
  describe 'visit Department index page' do
    before :each do
      @department_1 = Department.create({name: "Shoes", floor: 2})
      @department_2 = Department.create({name: "Purses", floor: 2})
      @department_3 = Department.create({name: "Appliances", floor: 1})
      @employee_1 = Employee.create({name: "Jeff", level: 2})
      @employee_2 = Employee.create({name: "Margaret", level: 2})
      @employee_3 = Employee.create({name: "Carla", level: 2})
      @employee_4 = Employee.create({name: "Juanita", level: 1})
      @employee_5 = Employee.create({name: "Facundo", level: 1})
      @employee_6 = Employee.create({name: "Meghan", level: 1})
    end
    it "see each department's name and floor" do
      visit '/departments'

      expect(page).to have_content("#{@department_1.name}")
      expect(page).to have_content("#{@department_3.name}")
      expect(page).to have_content("#{@department_2.name}")
      expect(page).to have_content("Level: #{@department_1.floor}")
      expect(page).to have_content("Level: #{@department_2.floor}")
      expect(page).to have_content("Level: #{@department_3.floor}")
    end

    it "under each department, see the names of all its employees"
  end
end