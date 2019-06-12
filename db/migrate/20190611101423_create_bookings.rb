class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.date :fromdate
      t.date :todate

      t.timestamps
    end
  end
end
