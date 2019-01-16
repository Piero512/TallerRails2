class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text :cast
      t.string :plan

      t.timestamps
    end
  end
end
