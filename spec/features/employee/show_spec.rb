require 'rails_helper'

RSpec.describe "Employee Show", type: :feature do
  describe 'visit the employee show page' do
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

    it 'see employee name and department' do
      visit "/employees/#{@employee_1.id}"

      expect(page).to have_content("#{@employee_1.name}")
      expect(page).to_not have_content("#{@employee_2.name}")
      expect(page).to have_content("Department: #{@employee_1.department}")
    end
  end
end