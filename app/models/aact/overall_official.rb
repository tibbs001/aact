module Aact
class OverallOfficial < StudyRelationship
  self.table_name='overall_officials'

  def self.top_level_label
    '//overall_official'
  end

  def attribs
    {:name=>get('last_name'),
     :role=>get('role'),
     :affiliation=>get('affiliation')}
  end

end
end
