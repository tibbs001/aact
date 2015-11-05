module Aact
class ResponsibleParty < StudyRelationship
  self.table_name='responsible_parties'

  def self.top_level_label
    '//responsible_party'
  end

  def attribs
    {
      :responsible_party_type => get('responsible_party_type'),
      :investigator_affiliation => get('investigator_affiliation'),
      :investigator_full_name => get('investigator_full_name'),
      :investigator_title => get('investigator_title'),
    }
  end

  def label
    "#{try(:investigator_full_name)} #{try(:investigagtor_title)}"
  end

end
end
