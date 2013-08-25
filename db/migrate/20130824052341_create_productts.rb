class CreateProductts < ActiveRecord::Migration
  def change
    create_table :productts do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
