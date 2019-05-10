class CreateMailingLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :mailing_logs do |t|
      t.references :contact, foreign_key: true
      t.string :status
      t.integer :messages_count

      t.timestamps
    end
  end
end
