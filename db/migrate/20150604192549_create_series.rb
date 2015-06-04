class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :title
      t.string :original_title
      t.string :poster

      t.timestamps null: false
    end
  end
end
