module Aact
class ResultContact < StudyRelationship
  self.table_name='result_contacts'

  def self.top_level_label
    '//point_of_contact'
  end

  def attribs
    {
      :name_or_title => get('name_or_title'),
      :organization => get('organization'),
      :phone => get('phone'),
      :email => get('email'),
    }
  end

end
end
