require './lib/assets/scripts/PhotoSearch'
class Idea < ActiveRecord::Base
	before_save do 
		if self.image_url.blank? || title_changed?
			self.image_url = FlickrFinder.new.find_image(self.title)
		end
	end

	def validate_each(record, attribute, value)
    begin
    	puts "&&&&&&&&&&&&&&&&&& each attribute #{attribute}"
    	if attribute == 'image_url'
    		puts "######################## validate image_url #{value}"
    		uri = URI.parse(value)
      		resp = uri.kind_of?(URI::HTTP)
      		puts "&&&&&&&&&&&&&&&&&& Seems like a invalid url. lets get a new url &&&&&&&&&&&&&&&&&&"
      		if resp == false
      			puts "&&&&&&&&&&&&&&&&&& Seems like a invalid url. lets get a new url &&&&&&&&&&&&&&&&&&"
      			value = FlickrFinder.new.find_image(self.title)
      		end
    	end
    end
  end
end
