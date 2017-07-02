class ChangeDepartureName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :flights, :depature_date, :departure_date
  end
end
