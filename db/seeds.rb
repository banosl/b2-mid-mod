# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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