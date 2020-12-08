class AddUserIdToIntros < ActiveRecord::Migration[6.0]
  def change
    add_column :intros, :user_id, :integer
  end
end
