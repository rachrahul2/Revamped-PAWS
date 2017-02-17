class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :first, :string
    add_column :users, :second, :string
    add_column :users, :string, :string
    add_column :users, :third, :string
    add_column :users, :fourth, :string
    add_column :users, :fifth, :string
    add_column :users, :sixth, :string
  end
end
