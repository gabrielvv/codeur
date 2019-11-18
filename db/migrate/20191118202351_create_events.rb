class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :name
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end
