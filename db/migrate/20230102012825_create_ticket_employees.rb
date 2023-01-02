class CreateTicketEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_employees do |t|
      t.integer :ticket_id
      t.integer :employee_id
    end
  end
end
