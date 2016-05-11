class AddDefaultCountValueToFields < ActiveRecord::Migration
  def change
    change_column_default :fields, :count, 0
  end
end
