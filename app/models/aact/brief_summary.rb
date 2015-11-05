module Aact
class BriefSummary < StudyRelationship
  self.table_name='brief_summaries'

  def attribs
    {:description=>get_text('brief_summary')}
  end

end
end
