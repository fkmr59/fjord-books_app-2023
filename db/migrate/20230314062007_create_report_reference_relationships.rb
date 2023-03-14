class CreateReportReferenceRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :report_reference_relationships do |t|
      t.integer :mentioning_report_id
      t.integer :mentioned_report_id
      
      t.timestamps
    end
  end
end
