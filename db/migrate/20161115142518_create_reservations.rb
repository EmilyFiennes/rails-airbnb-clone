class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_on
      t.datetime :end_on
      t.datetime :validated_on
      t.datetime :cancelled_on
      t.datetime :declined_on
      t.string :user_review
      t.integer :user_rating
      t.string :owner_review
      t.integer :owner_rating

      t.timestamps
    end
  end
end
