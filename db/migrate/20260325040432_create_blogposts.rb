class CreateBlogposts < ActiveRecord::Migration[8.1]
  def change
    create_table :blogposts do |t|
      t.string :blogtitle
      t.string :blockbody

      t.timestamps
    end
  end
end
