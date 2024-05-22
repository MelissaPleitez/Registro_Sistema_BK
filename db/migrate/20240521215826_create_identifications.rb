class CreateIdentifications < ActiveRecord::Migration[7.1]
  def change
    create_table :identifications do |t|
      t.string :identification_number
      t.string :breadcast_date
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
