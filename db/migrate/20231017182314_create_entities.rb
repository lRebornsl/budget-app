class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :author_id
      t.string :name
      t.decimal :amount
      # other attributes if present
      t.timestamps
    end
  end
end
