class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :content
      t.integer :user_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
