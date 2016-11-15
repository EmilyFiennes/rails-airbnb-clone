class AddItemReferencesToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_reference :availabilities, :item, foreign_key: true
  end
end
