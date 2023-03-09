class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text  :content
      t.references :imageable, polymorphic: true, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
