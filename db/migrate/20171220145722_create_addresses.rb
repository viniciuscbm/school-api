class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :number
      t.references :school

      t.timestamps
    end
  end
end
