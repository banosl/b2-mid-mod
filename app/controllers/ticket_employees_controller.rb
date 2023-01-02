class TicketEmployeesController < ApplicationController
  def create
    # binding.pry
    TicketEmployee.create({ticket_id: params[:ticket_id].to_i, employee_id: params[:id]})
  end
end