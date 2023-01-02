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
      @ticket_1 = Ticket.create({subject: "Broken shoe", age: 3})
      @ticket_2 = Ticket.create({subject: "Old mold", age: 5})
      @ticket_3 = Ticket.create({subject: "Need trash bags", age: 7})
      @ticket_4 = Ticket.create({subject: "Broken printer", age: 3})
      @ticket_5= Ticket.create({subject: "Rat problem", age: 38})
      @ticket_6 = Ticket.create({subject: "Burnt popcorn", age: 3})
      @ticket_7 = Ticket.create({subject: "No pie left", age: 33})
      @ticket_8 = Ticket.create({subject: "Large you know what", age: 23})
      @ticket_9 = Ticket.create({subject: "Delivery", age: 13})
      @ticket_10 = Ticket.create({subject: "Awkward silences", age: 33})
      @ticket_11 = Ticket.create({subject: "Smells", age: 56})
      @ticket_12 = Ticket.create({subject: "Broken door", age: 6})
      @ticket_employee_1 = TicketEmployee.create({ticket_id: @ticket_5.id, employee_id: @employee_3.id})
      @ticket_employee_2 = TicketEmployee.create({ticket_id: @ticket_6.id, employee_id: @employee_3.id})
      @ticket_employee_3 = TicketEmployee.create({ticket_id: @ticket_12.id, employee_id: @employee_3.id})
      @ticket_employee_4 = TicketEmployee.create({ticket_id: @ticket_8.id, employee_id: @employee_5.id})
    #   @ticket_employee_5 = TicketEmployee.create({})
    #   @ticket_employee_6 = TicketEmployee.create({})
    #   @ticket_employee_7 = TicketEmployee.create({})
    #   @ticket_employee_8 = TicketEmployee.create({})
    #   @ticket_employee_9 = TicketEmployee.create({})
    end

    it 'see employee name and department' do
      visit "/employees/#{@employee_1.id}"

      expect(page).to have_content("#{@employee_1.name}")
      expect(page).to_not have_content("#{@employee_2.name}")
      expect(page).to have_content("Department: #{@employee_1.department.name}")
    end

    it "see a list of all the employee's tickets and not ones not assigned to them" do
      visit "/employees/#{@employee_3.id}"

      expect(page).to have_content("#{@ticket_5.subject}")
      expect(page).to have_content("#{@ticket_6.subject}")
      expect(page).to have_content("#{@ticket_12.subject}")
      expect(page).to_not have_content("#{@ticket_2.subject}")
    end

    it "see a form to add a ticket to this department" do
      visit "/employees/#{@employee_4.id}"

      expect(page).to have_field("Ticket ID:")
    end

    it "form is filled out with id of ticket that already exists 
    and user is redirected back to the employee's show page with the ticket subject listed"do
      visit "/employees/#{@employee_5.id}"

      expect(page).to have_content("#{@ticket_8.subject}")
      expect(page).to_not have_content("#{@ticket_2.subject}")
      expect(page).to_not have_content("#{@ticket_3.subject}")

      fill_in "Ticket ID:", with: "#{@ticket_2.id}"
      click_button "Assign Ticket"

      expect(page).to have_content("#{@ticket_2.subject}")
    end
  end
end