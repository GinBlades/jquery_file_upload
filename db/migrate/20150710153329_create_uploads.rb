class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :thing

      t.timestamps null: false
    end
  end
end
