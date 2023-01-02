class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end

  def create
    binding.pry
  end
end