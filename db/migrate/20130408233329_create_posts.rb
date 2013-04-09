class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :author_email
      t.string :title
      t.text :content
      t.boolean :comments_closure

      t.timestamps
    end
  end
end
