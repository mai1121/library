class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :quote, null:false
      t.text :comment
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end
  end
end
