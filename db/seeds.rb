# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@department_1 = Department.create({name: "Shoes", level: 2})
@department_2 = Department.create({name: "Purses", level: 2})
@department_3 = Department.create({name: "Appliances", level: 1})
@employee_1 = Employee.create({name: "Jeff", level: 2})
@employee_2 = Employee.create({name: "Margaret", level: 2})
@employee_3 = Employee.create({name: "Carla", level: 2})
@employee_4 = Employee.create({name: "Juanita", level: 1})
@employee_5 = Employee.create({name: "Facundo", level: 1})
@employee_6 = Employee.create({name: "Meghan", level: 1})