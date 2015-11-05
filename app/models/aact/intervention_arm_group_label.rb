module Aact
class InterventionArmGroupLabel < StudyRelationship
  self.table_name='intervention_arm_group_labels'

  def self.top_level_label
    'arm_group_label'
  end

  def attribs
    {:label=>xml.inner_html}
  end

end
end

