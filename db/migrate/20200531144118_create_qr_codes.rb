class CreateQrCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :qr_codes do |t|
      t.integer :user_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
