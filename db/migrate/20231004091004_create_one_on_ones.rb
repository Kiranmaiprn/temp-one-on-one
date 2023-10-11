class CreateOneOnOnes < ActiveRecord::Migration[7.0]
  def change
    create_table :one_on_ones do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :member_id
      t.date :date
      t.time :time
      t.boolean :repeat_monthly
      t.boolean :flag
      t.string :true
      t.timestamps
    end
  end
end
