class CreateJoinTablePaymentsCategories < ActiveRecord::Migration[7.1]
  def change
    create_join_table :payments, :categories do |t|
    end
  end
end
