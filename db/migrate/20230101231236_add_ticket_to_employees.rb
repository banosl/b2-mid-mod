class AddTicketToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :ticket, foreign_key: true
  end
end
