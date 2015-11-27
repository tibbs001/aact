module Aact
	class SearchResult < StudyRelationship

	  establish_connection "aact_#{Rails.env}".to_sym if Rails.env != 'test'
		self.table_name='search_results'

		def attribs
			{
			:job_id=>opts[:job_id],
			:nct_id=>get('nct_id'),
			:order=>get('order'),
			:score=>get('score'),
			:title=>get('title'),
			:status=>get('status'),
			:conditions=>get('condition_summary'),
			:interventions=>get('intervention_summary'),
			:last_updated_date=>get('last_changed'),
			}
		end

	end
end
