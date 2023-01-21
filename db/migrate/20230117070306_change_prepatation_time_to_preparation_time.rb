class ChangePrepatationTimeToPreparationTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :prepatation_time, :preparation_time
  end
end
