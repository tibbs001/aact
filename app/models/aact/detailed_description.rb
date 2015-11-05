module Aact
class DetailedDescription < StudyRelationship
   self.table_name='detailed_descriptions'

  def attribs
    {:description=>get_text('detailed_description')}
  end

end
end
