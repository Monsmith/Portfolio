class CreatePortfs < ActiveRecord::Migration[5.1]
  def change
    create_table :portfs do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.text :thumn_image

      t.timestamps
    end
  end
end
