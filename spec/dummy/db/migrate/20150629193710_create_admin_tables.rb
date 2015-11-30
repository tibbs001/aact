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
      t.text   :description
      t.timestamps null: false
    end

    create_table :search_results do |t|
      t.date    :search_datestamp
      t.string  :search_term
      t.string  :nct_id
      t.integer :order
      t.decimal :score, :precision => 6, :scale => 6
      t.timestamps null: false
    end
  end
end
