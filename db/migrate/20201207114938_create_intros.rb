class CreateIntros < ActiveRecord::Migration[6.0]
  def change
    create_table :intros do |t|
      t.string :miku
      t.string :hyogo

      t.timestamps
    end
  end
end
