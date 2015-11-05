module Aact
	require 'active_support/all'
	class StudyTemplate
		attr_accessor :xml

		def initialize(opts)
			@xml=opts[:xml]
		end

		def nct_id
			get('nct_id')
		end

		def attribs
			{
				:start_date => get_date(get('start_date')),
				:first_received_date => get_date(get('firstreceived_date')),
				:verification_date => get_date(get('verification_date')),
				:last_changed_date => get_date(get('lastchanged_date')),
				:primary_completion_date => get_date(get('primary_completion_date')),
				:completion_date => get_date(get('completion_date')),
				:first_received_results_date => get_date(get('firstreceived_results_date')),
				:download_date => get_date(get('download_date')),

				:start_date_str => get('start_date'),
				:first_received_date_str => get('firstreceived_date'),
				:verification_date_str => get('verification_date'),
				:last_changed_date_str => get('lastchanged_date'),
				:primary_completion_date_str => get('primary_completion_date'),
				:completion_date_str => get('completion_date'),
				:first_received_results_date_str => get('firstreceived_results_date'),
				:download_date_str => get('download_date'),

				:nct_id => nct_id,
				:org_study_id => get('org_study_id '),
				:acronym =>get('acronym'),
				:number_of_arms => get('number_of_arms'),
				:number_of_groups =>get('number_of_groups'),
				:source => get('study_source'),
				:brief_title  => get('brief_title') ,
				:official_title => get('official_title'),
				:overall_status => get('overall_status'),
				:phase => get('phase'),
				:target_duration => get('target_duration'),
				:enrollment => get('enrollment'),
				:biospec_description =>get_text('biospec_descr').strip,

				:primary_completion_date_type => get_type('primary_completion_date'),
				:completion_date_type => get_type('completion_date'),
				:enrollment_type => get_type('enrollment'),
				:study_type => get('study_type'),
				:biospec_retention =>get('biospec_retention').strip,
				:limitations_and_caveats  =>get('limitations_and_caveats'),

				:is_section_801 => get_boolean('is_section_801'),
				:is_fda_regulated => get_boolean('is_fda_regulated'),
				:has_expanded_access => get_boolean('has_expanded_access'),
				:has_dmc => get_boolean('has_dmc'),
				:why_stopped =>get('why_stopped').strip,
				#:delivery_mechanism =>delivery_mechanism,

				:expected_groups =>       Aact::ExpectedGroup.create_all_from(opts),
				:actual_groups =>         Aact::ActualGroup.create_all_from(opts),

				:actual_outcomes =>       Aact::ActualOutcome.create_all_from(opts),
				:detailed_description =>  Aact::DetailedDescription.create_from(opts),
				:design =>                Aact::Design.create_from(opts),
				:brief_summary        =>  Aact::BriefSummary.create_from(opts),
				:eligibility =>           Aact::Eligibility.create_from(opts),
				:result_detail =>         Aact::ResultDetail.create_from(opts),

				:baseline_measures =>     Aact::BaselineMeasure.create_all_from(opts),
				:browse_conditions =>     Aact::BrowseCondition.create_all_from(opts),
				:browse_interventions =>  Aact::BrowseIntervention.create_all_from(opts),
				:conditions =>            Aact::Condition.create_all_from(opts),
				:facilities =>            Aact::Facility.create_all_from(opts),
				:interventions =>         Aact::Intervention.create_all_from(opts),
				:keywords =>              Aact::Keyword.create_all_from(opts),
				:links =>                 Aact::Link.create_all_from(opts),
				:location_countries =>    Aact::LocationCountry.create_all_from(opts),
				:oversight_authorities => Aact::OversightAuthority.create_all_from(opts),
				:overall_officials =>     Aact::OverallOfficial.create_all_from(opts),
				:periods =>               Aact::Period.create_all_from(opts),
				:expected_outcomes =>     Aact::ExpectedOutcome.create_all_from(opts),
				:reported_events =>       Aact::ReportedEvent.create_all_from(opts),
				:responsible_parties =>   Aact::ResponsibleParty.create_all_from(opts),
				:result_agreements =>     Aact::ResultAgreement.create_all_from(opts),
				:result_contacts =>       Aact::ResultContact.create_all_from(opts),
				:secondary_ids =>         Aact::SecondaryId.create_all_from(opts),
				:study_references =>      Aact::StudyReference.create_all_from(opts.merge(:nct_id=>nct_id)),
				:result_references =>     Aact::ResultReference.create_all_from(opts.merge(:nct_id=>nct_id)),
				:sponsors =>              Aact::Sponsor.create_all_from(opts),
			}
		end

		def opts
			{
				:xml=>xml,
				:nct_id=>get('nct_id'),
				:is_new=>true
			}
		end

		private

		def get(label)
			xml.xpath("//#{label}").inner_html
		end

		def get_boolean(label)
			val=xml.xpath("//#{label}").try(:inner_html)
			val.downcase=='yes'||val.downcase=='y'||val.downcase=='true' if !val.blank?
		end

		def get_text(label)
			str=''
			nodes=xml.xpath("//#{label}")
			nodes.each {|node| str << node.xpath("textblock").inner_html}
			str
		end

		def get_type(label)
			node=xml.xpath("//#{label}")
			node.attribute('type').try(:value) if !node.blank?
		end

		def get_date(str)
			Date.parse(str) if !str.blank?
		end
	end
end
