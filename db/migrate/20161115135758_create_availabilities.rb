class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.datetime :start_on
      t.datetime :end_on

      t.timestamps
    end
  end
end
