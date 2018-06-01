class CreateFreechatUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :freechat_users do |t|
      t.references :freechat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
