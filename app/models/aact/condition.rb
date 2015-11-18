module Aact
	class Condition < StudyRelationship
		 self.table_name='conditions'

		def self.create_all_from(opts)
			opts[:xml].xpath("//condition").collect{|xml|new(:name=>xml.inner_html)}
		end

	end
end

