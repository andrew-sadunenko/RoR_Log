class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :username
      t.date :created_at
      t.string :ip

      t.timestamps
    end
  end
end
