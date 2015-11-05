require 'faraday'
require 'nokogiri'
require 'net/http'
# API command to retrieve all ct.gov data:  http://clinicaltrials.gov/search?term=&resultsxml=true

module Aact
	class Asker

		attr_accessor :existing_nct_ids, :should_refresh

		def self.sample
			new.create_study('NCT02028676')
		end

		def self.create_all_studies(opts={})
			self.new.create_all_studies(opts)
		end

		def existing_nct_ids
			@existing_nct_ids ||= Aact::Study.all.collect{|s|s.nct_id}
		end

		def create_all_studies(opts={})
			@should_refresh=opts[:should_refresh]
			collection=[]
			ctgov_pages.each {|page|
				tries=50
				begin
					response = Faraday.get("https://clinicaltrials.gov/#{page}").body
					Nokogiri::HTML(response).css('.layout_table').search('a').each { |link|
						nct_id=link['href'].split('/').last
						if !existing_nct_ids.include? nct_id
							create_study(nct_id)
						else
							puts " #{nct_id} already exists"
							if should_refresh
	              log_event({:nct_id=>nct_id,:event_type=>'refresh',:status=>'active'})
								Study.where('nct_id=?',nct_id).first.destroy
								create_study(nct_id)
							else
	              log_event({:nct_id=>nct_id,:event_type=>'skipped',:status=>'complete'})
							end
						end
					}
				rescue
					tries = tries-1
					if tries > 0
						puts "> call to ct.gov failed.  Trying again!  "
						sleep(5)
						retry
					else
						puts "Repeatedly tried request: https://clinicaltrials.gov/#{page}. Should I give up? :-("
						#   exit
					end
				end
			}
		end

		def log_event(opts={})
			e=Aact::LoadEvent.new(:nct_id=>opts[:nct_id],:event_type=>opts[:event_type],:status=>opts[:status])
			e.save!
			e
		end

		def self.get(nct_id)
			self.new.get_study(nct_id)
		end

		def ctgov_pages
			collection=[]
			response = Faraday.get('https://clinicaltrials.gov/ct2/crawl').body
			Nokogiri::HTML(response).css('.layout_table').search('a').each { |link| collection << link['href'] }
			collection
		end

		def get_study(nct_id)
			xml=Nokogiri::XML(Faraday.get("http://clinicaltrials.gov/show/#{nct_id}?resultsxml=true").body)
			Aact::StudyTemplate.new({:xml => xml,:nct_id=>nct_id})
		end

		def create_study(nct_id)
			puts "creating #{nct_id}"
			e=log_event({:nct_id=>nct_id,:event_type=>'create',:status=>'active'})
			attribs=get_study(nct_id).attribs
			study=Aact::Study.new.create_from(attribs)
			existing_nct_ids << nct_id
			e.status='complete'
			e.save!
			return study
		end
	end
end
