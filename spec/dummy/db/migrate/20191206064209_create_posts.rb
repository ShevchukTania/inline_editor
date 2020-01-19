class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :about
      t.datetime :publiched_at
      t.boolean :important
      t.integer :likes_count

      t.timestamps null: false
    end
  end
end
