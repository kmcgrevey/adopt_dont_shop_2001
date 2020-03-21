class ChangeStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :pets, :status, 0
  end
end
