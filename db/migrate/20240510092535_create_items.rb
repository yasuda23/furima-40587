class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :explanation,      null: false
      t.integer    :category_id,      null: false
      t.integer    :quality_id,       null: false
      t.integer    :who_pay_id,       null: false
      t.integer    :delivery_area_id, null: false
      t.integer    :delivery_day_id,  null: false
      t.integer    :price,            null: false
      t.references :user,             null: false,  foreign_key: true
      t.timestamps
    end
  end
end
