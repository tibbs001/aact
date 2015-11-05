class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies, {:id => false} do |t|
      t.string :nct_id, primary: true

      t.date :start_date
      t.date :first_received_date
      t.date :verification_date
      t.date :last_changed_date
      t.date :primary_completion_date
      t.date :completion_date
      t.date :first_received_results_date
      t.date :download_date

      t.string :start_date_str
      t.string :first_received_date_str
      t.string :verification_date_str
      t.string :last_changed_date_str
      t.string :primary_completion_date_str
      t.string :completion_date_str
      t.string :first_received_results_date_str
      t.string :download_date_str
      t.string :completion_date_type
      t.string :primary_completion_date_type
      t.string :org_study_id
      t.string :secondary_id
      t.string :brief_title 
      t.string :official_title
      t.string :overall_status
      t.string :phase
      t.string :target_duration
      t.integer :enrollment
      t.string :enrollment_type
      t.string :study_type
      t.integer :number_of_arms
      t.integer :number_of_groups
      t.string :source

      t.string :biospec_retention
      t.string :biospec_description
      t.string :study_rank
      t.string :limitations_and_caveats 
      t.string :delivery_mechanism
      t.string :description
      t.string :acronym
      t.string :why_stopped

      t.boolean :is_section_801
      t.boolean :is_fda_regulated
      t.boolean :has_expanded_access
      t.boolean :has_dmc
      t.timestamps null: false
    end

    create_table :facilities do |t|
      t.string :name
      t.string :status
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :contact_backup_name
      t.string :contact_backup_phone
      t.string :contact_backup_email
      t.string :investigator_name
      t.string :investigator_role
      t.timestamps null: false
    end
    add_column :facilities, :nct_id, :string, references: :studies

    create_table :expected_groups do |t|
      t.string  :ctgov_group_id
      t.integer :ctgov_group_enumerator
      t.string  :title
      t.string  :group_type
      t.string  :description
      t.timestamps null: false
    end
    add_column :expected_groups, :nct_id, :string, references: :studies

    create_table :conditions do |t|
      t.string  :condition_name
      t.timestamps null: false
    end
    add_column :conditions, :nct_id, :string, references: :studies

    create_table :interventions do |t|
      t.string  :intervention_type
      t.string  :intervention_name
      t.string  :description
      t.timestamps null: false
    end
    add_column :interventions, :nct_id, :string, references: :studies

    create_table :intervention_other_names do |t|
      t.string  :name
      t.timestamps null: false
    end
    add_column :intervention_other_names, :nct_id, :string, references: :studies
    add_column :intervention_other_names, :intervention_id, :string, references: :studies

    create_table :intervention_arm_group_labels do |t|
      t.string  :label
      t.timestamps null: false
    end
    add_column :intervention_arm_group_labels, :nct_id, :string, references: :studies
    add_column :intervention_arm_group_labels, :intervention_id, :string, references: :studies

    create_table :keywords do |t|
      t.string :keyword
      t.timestamps null: false
    end
    add_column :keywords, :nct_id, :string, references: :studies

    create_table :browse_conditions do |t|
      t.string :mesh_term
      t.timestamps null: false
    end
    add_column :browse_conditions, :nct_id, :string, references: :studies

    create_table :browse_interventions do |t|
      t.string :mesh_term
      t.timestamps null: false
    end
    add_column :browse_interventions, :nct_id, :string, references: :studies

    create_table :expected_outcomes do |t|
      t.string :outcome_type
      t.string :title
      t.string :measure
      t.string :time_frame
      t.string :safety_issue
      t.string :population
      t.text   :description
    end
    add_column :expected_outcomes, :nct_id, :string, references: :studies

    create_table :study_references do |t|
      t.string :citation
      t.string :pmid
      t.string :reference_type
    end
    add_column :study_references, :nct_id, :string, references: :studies

    create_table :responsible_parties do |t|
      t.string :responsible_party_type
      t.string :investigator_affiliation
      t.string :investigator_full_name
      t.string :investigator_title
    end
    add_column :responsible_parties, :nct_id, :string, references: :studies

    create_table :designs do |t|
      t.text   :description
    end
    add_column :designs, :nct_id, :string, references: :studies

    create_table :location_countries do |t|
      t.string :country
    end
    add_column :location_countries, :nct_id, :string, references: :studies

    create_table :sponsors do |t|
      t.string :sponsor_type
      t.string :agency
      t.string :agency_class
    end
    add_column :sponsors, :nct_id, :string, references: :studies

    create_table :overall_officials do |t|
      t.string :name
      t.string :role
      t.string :affiliation
    end
    add_column :overall_officials, :nct_id, :string, references: :studies

    create_table :oversight_authorities do |t|
      t.string :name
    end
    add_column :oversight_authorities, :nct_id, :string, references: :studies

    create_table :links do |t|
      t.string :url
      t.string :description
    end
    add_column :links, :nct_id, :string, references: :studies

    create_table :secondary_ids do |t|
      t.string :secondary_id
    end
    add_column :secondary_ids, :nct_id, :string, references: :studies

    create_table :eligibilities do |t|
      t.string :sampling_method
      t.string :gender
      t.string :minimum_age
      t.string :maximum_age
      t.string :healthy_volunteers
      t.string :study_population
      t.text :criteria
    end
    add_column :eligibilities, :nct_id, :string, references: :studies

    create_table :detailed_descriptions do |t|
      t.text :description
    end
    add_column :detailed_descriptions, :nct_id, :string, references: :studies

    create_table :brief_summaries do |t|
      t.text :description
    end
    add_column :brief_summaries, :nct_id, :string, references: :studies

  end

end
