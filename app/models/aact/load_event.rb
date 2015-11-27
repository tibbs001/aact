module Aact
	class LoadEvent < ActiveRecord::Base
	  self.table_name='load_events'
	  establish_connection "aact_#{Rails.env}".to_sym if Rails.env != 'test'
	end
end
