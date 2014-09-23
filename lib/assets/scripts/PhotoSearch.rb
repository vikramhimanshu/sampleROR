# require 'flickraw'
# FlickRaw.api_key = "1823100373f8cd4cab51175a9bebee8a"
# FlickRaw.shared_secret = "24a429270aec9d05"

# module Sizes
#   SQUARE = 'Square'
#   LARGE_SQ = 'Large Square'
#   THUMBNAIL = 'Thumbnail'
#   SMALL = 'Small'
#   SMALL_320 = 'Small 320'
#   MEDIUM = 'Medium'
#   MEDIUM_640 = 'Medium 640'
#   MEDIUM_800 = 'Medium 800'
#   LARGE = 'Large'
#   LARGE_1600 = 'Large 1600'
#   LARGE_2048 = 'Large 2048'
# end

# class PhotoSearch

#  def initialize(searchText)
#  	@searchText = searchText
#  end

#  def search
# 	puts "Searching for #{@searchText} photos"
# 	list = flickr.photos.search :text => @searchText
# 	anyobj = list.to_a.sample;
# 	puts "found #{list.length} photos. \npicking #{anyobj.id}"
# 	id = anyobj.id
# 	sizes = flickr.photos.getSizes :photo_id => id
# 	original = sizes.find {|s| s.label == 'Original' }
# 	puts original.url
#  end
# end

require 'flickraw'
FlickRaw.api_key="1823100373f8cd4cab51175a9bebee8a"
FlickRaw.shared_secret="24a429270aec9d05"

class FlickrFinder

  DEFAULT_TYPE = 'Large Square'

  def initialize(image_type = DEFAULT_TYPE)
    @image_type = image_type
  end

  def find_image(query)
    return nil if query.nil? or query.empty?
    photo = search_for_image(query)
    return nil if photo.nil?
    get_image_url(photo)
  end

  private

  def search_for_image(query)
    response = flickr.photos.search(text: query)
    photo = response.first
  end

  def get_image_url(photo)
    sizes = flickr.photos.getSizes :photo_id => photo.id
    large_square = sizes.find {|s| s.label == @image_type }
    large_square.source
  end

end