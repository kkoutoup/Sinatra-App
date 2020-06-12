class AddDateToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :date, :string
  end
end