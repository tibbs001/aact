module Aact
require 'csv'
class DataDefinition < ActiveRecord::Base
   self.table_name='data_definitions'

  def self.nlm_info_for(aact_column)
    find_by_aact_column(aact_column).nlm_definition
  end

  def self.ctti_info_for(aact_column)
    find_by_aact_column(aact_column).ctti_notes
  end

  def self.load
    csv_text = File.read('csv/DataDictionary.csv', :encoding => 'windows-1251:utf-8')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each {|row|
      self.create!(row.to_hash)
    }
  end
end
end
