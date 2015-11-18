module Aact
	class Link < StudyRelationship
		self.table_name='links'

		def self.top_level_label
			'//link'
		end

		def attribs
			{:url=>get('url'),
			 :description => get('description')}
		end

	end
end
