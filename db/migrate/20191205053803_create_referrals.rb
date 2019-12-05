class CreateReferrals < ActiveRecord::Migration[6.0]
  def change
    create_table :referrals do |t|
      t.integer :referrer
      t.integer :referred
      t.integer :referredby_id

      t.timestamps
    end
  end
end
