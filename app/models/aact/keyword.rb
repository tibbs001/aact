module Aact
	class Keyword < StudyRelationship
		self.table_name='keywords'

		def self.top_level_label
			'//keyword'
		end

		def attribs
			{:name => opts[:xml].inner_html}
		end

	end
end
