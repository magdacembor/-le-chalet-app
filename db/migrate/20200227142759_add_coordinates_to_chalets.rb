class AddCoordinatesToChalets < ActiveRecord::Migration[6.0]
  def change
    add_column :chalets, :latitude, :float
    add_column :chalets, :longitude, :float
  end
end
