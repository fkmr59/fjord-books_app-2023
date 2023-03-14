class AddIndexToReportReferenceRelationships < ActiveRecord::Migration[7.0]
  def change
    add_index :report_reference_relationships, [:mentioned_report_id, :mentioning_report_id], unique: true, name: 'report_reference_relationships_index'
  end
end
