module Aact
class Condition < StudyRelationship
   self.table_name='conditions'

  def self.create_all_from(opts)
    opts[:xml].xpath("//condition").collect{|xml|new(:condition_name=>xml.inner_html)}
  end

  def name
    condition_name
  end

end
end

