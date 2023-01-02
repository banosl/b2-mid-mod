class TicketEmployeesController < ApplicationController
  def create
    TicketEmployee.create({ticket_id: params[:ticket_id].to_i, employee_id: params[:id]})
    redirect_to "/employees/#{params[:id]}"
  end
end