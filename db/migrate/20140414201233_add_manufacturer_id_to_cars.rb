class AddManufacturerIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :manufacturer_id, :integer
    add_column :manufacturers, :car_id, :integer
  end
end
