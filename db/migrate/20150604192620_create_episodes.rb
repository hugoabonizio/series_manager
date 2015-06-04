class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :serie, index: true, foreign_key: true
      t.string :title
      t.integer :episode
      t.integer :season

      t.timestamps null: false
    end
  end
end
