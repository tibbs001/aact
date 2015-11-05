class CreateAdminTables < ActiveRecord::Migration
  def change

    create_table :data_definitions do |t|
      t.string :aact_column
      t.string :aact_table
      t.string :value_list
      t.string :ctgov_source
      t.string :nlm_required
      t.string :fdaaa_required
      t.string :nlm_definition
      t.string :ctti_notes
      t.string :data_source
      t.string :data_field
    end

    create_table :load_events do |t|
      t.string :nct_id
      t.string :event_type
      t.string :status
      t.string :description
      t.timestamps null: false
    end

  end
end
