class AddTicketTypeIdsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :ticket_type_id, :integer
  end
end
