require 'rails_helper'

RSpec.describe "Department Index", type: :feature do
  describe 'visit Department index page' do
    before :each do
      @department_1 = Department.create({name: "Shoes", floor: 2})
      @department_2 = Department.create({name: "Purses", floor: 2})
      @department_3 = Department.create({name: "Appliances", floor: 1})
      @employee_1 = Employee.create({name: "Jeff", level: 2, department_id: @department_1.id})
      @employee_2 = Employee.create({name: "Margaret", level: 2, department_id: @department_2.id})
      @employee_3 = Employee.create({name: "Carla", level: 2, department_id: @department_1.id})
      @employee_4 = Employee.create({name: "Juanita", level: 1, department_id: @department_3.id})
      @employee_5 = Employee.create({name: "Facundo", level: 1, department_id: @department_3.id})
      @employee_6 = Employee.create({name: "Meghan", level: 1, department_id: @department_3.id})
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

    it "under each department, see the names of all its employees" do
      visit '/departments'

      within ("#department-#{@department_1.id}") do
        expect(page).to have_content("#{@employee_1.name}")
        expect(page).to have_content("#{@employee_3.name}")
      end

      within ("#department-#{@department_2.id}") do
        expect(page).to have_content("#{@employee_2.name}")
        expect(page).to_not have_content("#{@employee_3.name}")
      end

      within ("#department-#{@department_3.id}") do
        expect(page).to have_content("#{@employee_4.name}")
        expect(page).to have_content("#{@employee_5.name}")
        expect(page).to have_content("#{@employee_6.name}")
        expect(page).to_not have_content("#{@employee_2.name}")
      end
    end
  end
end