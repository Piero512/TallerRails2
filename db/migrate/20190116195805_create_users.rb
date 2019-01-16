class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :pass
      t.date :dob
      t.string :plan
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
