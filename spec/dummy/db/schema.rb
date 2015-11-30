# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150629193710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actual_groups", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "group_type"
    t.string  "title"
    t.string  "description"
    t.integer "participant_count"
    t.string  "nct_id"
  end

  create_table "actual_outcomes", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.text    "group_title"
    t.text    "group_description"
    t.string  "outcome_type"
    t.string  "title"
    t.text    "description"
    t.string  "measure"
    t.string  "time_frame"
    t.string  "safety_issue"
    t.string  "population"
    t.integer "participant_count"
    t.string  "nct_id"
  end

  create_table "baseline_measures", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "category"
    t.string  "title"
    t.text    "description"
    t.string  "units"
    t.string  "param"
    t.string  "measure_value"
    t.string  "lower_limit"
    t.string  "upper_limit"
    t.string  "dispersion"
    t.string  "spread"
    t.text    "measure_description"
    t.string  "nct_id"
  end

  create_table "brief_summaries", force: :cascade do |t|
    t.text   "description"
    t.string "nct_id"
  end

  add_index "brief_summaries", ["nct_id"], name: "index_brief_summaries_on_nct_id", using: :btree

  create_table "browse_conditions", force: :cascade do |t|
    t.string   "mesh_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nct_id"
  end

  add_index "browse_conditions", ["nct_id"], name: "index_browse_conditions_on_nct_id", using: :btree

  create_table "browse_interventions", force: :cascade do |t|
    t.string   "mesh_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nct_id"
  end

  add_index "browse_interventions", ["nct_id"], name: "index_browse_interventions_on_nct_id", using: :btree

  create_table "conditions", force: :cascade do |t|
    t.string   "condition_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "nct_id"
  end

  add_index "conditions", ["nct_id"], name: "index_conditions_on_nct_id", using: :btree

  create_table "data_definitions", force: :cascade do |t|
    t.string "aact_column"
    t.string "aact_table"
    t.string "value_list"
    t.string "ctgov_source"
    t.string "nlm_required"
    t.string "fdaaa_required"
    t.string "nlm_definition"
    t.string "ctti_notes"
    t.string "data_source"
    t.string "data_field"
  end

  create_table "designs", force: :cascade do |t|
    t.text   "description"
    t.string "nct_id"
  end

  add_index "designs", ["nct_id"], name: "index_designs_on_nct_id", using: :btree

  create_table "detailed_descriptions", force: :cascade do |t|
    t.text   "description"
    t.string "nct_id"
  end

  add_index "detailed_descriptions", ["nct_id"], name: "index_detailed_descriptions_on_nct_id", using: :btree

  create_table "drop_withdrawals", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "reason"
    t.integer "participant_count"
    t.string  "nct_id"
    t.integer "period_id"
  end

  create_table "eligibilities", force: :cascade do |t|
    t.string "sampling_method"
    t.string "gender"
    t.string "minimum_age"
    t.string "maximum_age"
    t.string "healthy_volunteers"
    t.string "study_population"
    t.text   "criteria"
    t.string "nct_id"
  end

  add_index "eligibilities", ["nct_id"], name: "index_eligibilities_on_nct_id", using: :btree

  create_table "expected_groups", force: :cascade do |t|
    t.string   "ctgov_group_id"
    t.integer  "ctgov_group_enumerator"
    t.string   "title"
    t.string   "group_type"
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "nct_id"
  end

  add_index "expected_groups", ["nct_id"], name: "index_expected_groups_on_nct_id", using: :btree

  create_table "expected_outcomes", force: :cascade do |t|
    t.string "outcome_type"
    t.string "title"
    t.string "measure"
    t.string "time_frame"
    t.string "safety_issue"
    t.string "population"
    t.text   "description"
    t.string "nct_id"
  end

  add_index "expected_outcomes", ["nct_id"], name: "index_expected_outcomes_on_nct_id", using: :btree

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "contact_backup_name"
    t.string   "contact_backup_phone"
    t.string   "contact_backup_email"
    t.string   "investigator_name"
    t.string   "investigator_role"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "nct_id"
  end

  add_index "facilities", ["nct_id"], name: "index_facilities_on_nct_id", using: :btree

  create_table "intervention_arm_group_labels", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "nct_id"
    t.string   "intervention_id"
  end

  add_index "intervention_arm_group_labels", ["intervention_id"], name: "index_intervention_arm_group_labels_on_intervention_id", using: :btree
  add_index "intervention_arm_group_labels", ["nct_id"], name: "index_intervention_arm_group_labels_on_nct_id", using: :btree

  create_table "intervention_other_names", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "nct_id"
    t.string   "intervention_id"
  end

  add_index "intervention_other_names", ["intervention_id"], name: "index_intervention_other_names_on_intervention_id", using: :btree
  add_index "intervention_other_names", ["nct_id"], name: "index_intervention_other_names_on_nct_id", using: :btree

  create_table "interventions", force: :cascade do |t|
    t.string   "intervention_type"
    t.string   "intervention_name"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "nct_id"
  end

  add_index "interventions", ["nct_id"], name: "index_interventions_on_nct_id", using: :btree

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nct_id"
  end

  add_index "keywords", ["nct_id"], name: "index_keywords_on_nct_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.string "description"
    t.string "nct_id"
  end

  add_index "links", ["nct_id"], name: "index_links_on_nct_id", using: :btree

  create_table "load_events", force: :cascade do |t|
    t.string   "nct_id"
    t.string   "event_type"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "location_countries", force: :cascade do |t|
    t.string "country"
    t.string "removed"
    t.string "nct_id"
  end

  add_index "location_countries", ["nct_id"], name: "index_location_countries_on_nct_id", using: :btree

  create_table "milestones", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "title"
    t.string  "description"
    t.integer "participant_count"
    t.string  "nct_id"
    t.integer "period_id"
  end

  create_table "outcome_analyses", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "title"
    t.string  "non_inferiority"
    t.string  "non_inferiority_description"
    t.string  "p_value"
    t.string  "param_type"
    t.string  "param_value"
    t.string  "ci_percent"
    t.string  "ci_n_sides"
    t.string  "ci_lower_limit"
    t.string  "ci_upper_limit"
    t.string  "method"
    t.text    "description"
    t.text    "group_description"
    t.text    "method_description"
    t.text    "estimate_description"
    t.string  "nct_id"
    t.integer "actual_outcome_id"
  end

  create_table "outcome_measures", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "category"
    t.string  "title"
    t.text    "description"
    t.string  "units"
    t.string  "param"
    t.string  "measure_value"
    t.string  "lower_limit"
    t.string  "upper_limit"
    t.string  "dispersion"
    t.string  "spread"
    t.string  "measure_description"
    t.string  "nct_id"
    t.integer "actual_outcome_id"
  end

  create_table "overall_officials", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "affiliation"
    t.string "nct_id"
  end

  add_index "overall_officials", ["nct_id"], name: "index_overall_officials_on_nct_id", using: :btree

  create_table "oversight_authorities", force: :cascade do |t|
    t.string "name"
    t.string "nct_id"
  end

  add_index "oversight_authorities", ["nct_id"], name: "index_oversight_authorities_on_nct_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.string "title"
    t.string "nct_id"
  end

  create_table "reported_event_overviews", force: :cascade do |t|
    t.string "time_frame"
    t.text   "description"
    t.string "nct_id"
  end

  create_table "reported_events", force: :cascade do |t|
    t.string  "ctgov_group_id"
    t.integer "ctgov_group_enumerator"
    t.string  "group_title"
    t.string  "group_description"
    t.string  "description"
    t.string  "time_frame"
    t.string  "category"
    t.string  "event_type"
    t.string  "frequency_threshold"
    t.string  "default_vocab"
    t.string  "default_assessment"
    t.string  "title"
    t.integer "subjects_affected"
    t.integer "subjects_at_risk"
    t.integer "event_count"
    t.string  "nct_id"
  end

  create_table "responsible_parties", force: :cascade do |t|
    t.string "responsible_party_type"
    t.string "investigator_affiliation"
    t.string "investigator_full_name"
    t.string "investigator_title"
    t.string "nct_id"
  end

  add_index "responsible_parties", ["nct_id"], name: "index_responsible_parties_on_nct_id", using: :btree

  create_table "result_agreements", force: :cascade do |t|
    t.string "pi_employee"
    t.string "agreement"
    t.string "agreement_type"
    t.string "nct_id"
  end

  create_table "result_contacts", force: :cascade do |t|
    t.string "name_or_title"
    t.string "organization"
    t.string "phone"
    t.string "email"
    t.string "nct_id"
  end

  create_table "result_details", force: :cascade do |t|
    t.text   "recruitment_details"
    t.text   "pre_assignment_details"
    t.string "nct_id"
  end

  create_table "search_results", force: :cascade do |t|
    t.date     "search_datestamp"
    t.string   "search_term"
    t.string   "nct_id"
    t.integer  "order"
    t.decimal  "score",            precision: 6, scale: 6
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "secondary_ids", force: :cascade do |t|
    t.string "secondary_id"
    t.string "nct_id"
  end

  add_index "secondary_ids", ["nct_id"], name: "index_secondary_ids_on_nct_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string "sponsor_type"
    t.string "agency"
    t.string "agency_class"
    t.string "nct_id"
  end

  add_index "sponsors", ["nct_id"], name: "index_sponsors_on_nct_id", using: :btree

  create_table "studies", id: false, force: :cascade do |t|
    t.string   "nct_id"
    t.date     "start_date"
    t.date     "first_received_date"
    t.date     "verification_date"
    t.date     "last_changed_date"
    t.date     "primary_completion_date"
    t.date     "completion_date"
    t.date     "first_received_results_date"
    t.date     "download_date"
    t.string   "start_date_str"
    t.string   "first_received_date_str"
    t.string   "verification_date_str"
    t.string   "last_changed_date_str"
    t.string   "primary_completion_date_str"
    t.string   "completion_date_str"
    t.string   "first_received_results_date_str"
    t.string   "download_date_str"
    t.string   "completion_date_type"
    t.string   "primary_completion_date_type"
    t.string   "org_study_id"
    t.string   "secondary_id"
    t.string   "brief_title"
    t.string   "official_title"
    t.string   "overall_status"
    t.string   "phase"
    t.string   "target_duration"
    t.integer  "enrollment"
    t.string   "enrollment_type"
    t.string   "study_type"
    t.integer  "number_of_arms"
    t.integer  "number_of_groups"
    t.string   "source"
    t.string   "biospec_retention"
    t.string   "biospec_description"
    t.string   "study_rank"
    t.string   "limitations_and_caveats"
    t.string   "delivery_mechanism"
    t.string   "description"
    t.string   "acronym"
    t.string   "why_stopped"
    t.boolean  "is_section_801"
    t.boolean  "is_fda_regulated"
    t.boolean  "has_expanded_access"
    t.boolean  "has_dmc"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "studies", ["nct_id"], name: "index_studies_on_nct_id", using: :btree
  add_index "studies", ["study_type"], name: "index_studies_on_study_type", using: :btree

  create_table "study_references", force: :cascade do |t|
    t.string "citation"
    t.string "pmid"
    t.string "reference_type"
    t.string "nct_id"
  end

  add_index "study_references", ["nct_id"], name: "index_study_references_on_nct_id", using: :btree

end
