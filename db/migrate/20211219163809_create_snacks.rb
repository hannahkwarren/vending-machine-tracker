class CreateSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.decimal :price, :decimal, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
