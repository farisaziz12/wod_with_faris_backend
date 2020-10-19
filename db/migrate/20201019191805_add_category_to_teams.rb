class AddCategoryToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :category, :string
  end
end
