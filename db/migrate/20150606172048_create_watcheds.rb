class CreateWatcheds < ActiveRecord::Migration
  def change
    create_table :watcheds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :episode, index: true, foreign_key: true
			t.references :series, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
