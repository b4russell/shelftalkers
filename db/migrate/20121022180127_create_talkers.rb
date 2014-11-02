class CreateTalkers < ActiveRecord::Migration
  def change
    create_table :talkers do |t|
      t.string :producer
      t.string :product
      t.text :blurb

      t.timestamps
    end
  end
end
