class AddCategoryToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :category, :string
  end
end
