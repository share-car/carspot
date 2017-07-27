class AddRentSettingRefToVehicleInfos < ActiveRecord::Migration[5.1]
  def change
    add_reference :vehicle_infos, :rent_setting, foreign_key: true
  end
end
