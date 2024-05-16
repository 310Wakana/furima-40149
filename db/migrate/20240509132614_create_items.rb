class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item                 ,null: false
      t.text :concept                 , null: false
      t.integer :category_id          , null: false, default: ""
      t.integer :state_id            , null: false, default: ""
      t.integer :delivery_charges_id  , null: false, default: ""
      t.integer :prefecture_id        , null: false, default: ""
      t.integer :arrival_date_id      , null: false, default: ""
      t.integer    :price,   null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
