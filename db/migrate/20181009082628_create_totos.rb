class CreateTotos < ActiveRecord::Migration[5.2]
  def change
    create_table :totos do |t|
      t.string :name
      t.text :description
    end
  end
end
