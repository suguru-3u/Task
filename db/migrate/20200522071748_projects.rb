class Projects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :body, :text
    add_column :projects, :responsible, :string
    add_column :projects, :end_date, :date
  end
end
