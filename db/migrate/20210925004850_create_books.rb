class CreateBooks < ActiveRecord::Migration[6.1]
  create_table :books do |t|
    t.string :title
    t.string :author
    t.integer :price
    t.datetime :published_date

    t.timestamps
  end
end
