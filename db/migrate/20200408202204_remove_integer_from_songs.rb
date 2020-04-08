class RemoveIntegerFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :integer, :string
  end
end
