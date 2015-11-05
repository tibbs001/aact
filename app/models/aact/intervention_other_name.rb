module Aact
class InterventionOtherName < StudyRelationship
  self.table_name='intervention_other_names'

  def self.top_level_label
    'other_name'
  end

  def attribs
    {:name=>xml.inner_html}
  end

end
end

