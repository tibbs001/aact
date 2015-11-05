module Aact
class ResultDetail < StudyRelationship
  self.table_name='result_details'

  def attribs
    {
     :recruitment_details => xml.xpath('//clinical_results').xpath('participant_flow').xpath('recruitment_details').children.text,
     :pre_assignment_details => xml.xpath('//clinical_results').xpath('participant_flow').xpath('pre_assignment_details').children.text,
    }
  end

end
end
