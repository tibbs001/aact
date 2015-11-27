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
      t.string  :job_id
      t.integer :order
      t.integer :score
      t.string  :nct_id
      t.text    :title
      t.string  :status
      t.string  :study_results
      t.text    :conditions
      t.text    :interventions
      t.string  :sponsors
      t.string  :gender
      t.string  :age_groups
      t.string  :phases
      t.integer :enrollment
      t.string  :funded_by
      t.string  :study_types
      t.text    :study_designs
      t.string  :other_ids
      t.date    :first_received_date
      t.date    :start_date
      t.date    :completion_date
      t.date    :last_updated_date
      t.date    :last_verified_date
      t.string  :results_first_received_date
      t.string  :acronym
      t.date    :primary_completion_date
      t.string  :outcome_measures
      t.string  :sites
      t.timestamps null: false
    end
  end
end
