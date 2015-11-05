module Aact
class Design < StudyRelationship
   self.table_name='designs'

  def attribs
    {:description=>xml.xpath("//study_design").try(:inner_html)}
  end

end
end
