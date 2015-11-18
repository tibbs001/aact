module Aact
	class ResultReference < StudyReference
		self.table_name='study_references'

		def self.top_level_label
			'//results_reference'
		end

		def attribs
			{ :citation => get('citation'),
				:pmid => get('PMID'),
				:reference_type => 'result',
			}
		end

		def type
			reference_type
		end

	end
end
