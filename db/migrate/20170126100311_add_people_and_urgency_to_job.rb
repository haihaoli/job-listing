class AddPeopleAndUrgencyToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :people, :integer
    add_column :jobs, :urgency, :string
  end
end
