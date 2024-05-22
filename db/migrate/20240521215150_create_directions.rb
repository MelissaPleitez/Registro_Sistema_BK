class CreateDirections < ActiveRecord::Migration[7.1]
  def change
    create_table :directions do |t|
      t.string :street
      t.string :city
      t.string :postal_code
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
