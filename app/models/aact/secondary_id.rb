module Aact
class SecondaryId < StudyRelationship
  self.table_name='secondary_ids'

  def self.top_level_label
    '//secondary_id'
  end

  def attribs
    {:secondary_id=>xml.inner_html}
  end

end
end
