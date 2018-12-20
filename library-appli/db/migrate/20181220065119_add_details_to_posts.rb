class AddDetailsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author, :string, null:false
    add_column :posts, :title, :string, null:false
  end
end
