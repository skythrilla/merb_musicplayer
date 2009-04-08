class Album
  include DataMapper::Resource
  include Paperclip::Resource
    
  property :id, Serial
  # property :artist_id, Integer
  property :title, String, :nullable => false
  property :catalog_index, String            
  property :info, Text
  
  # belongs_to, :artist  
  has n, :songs      
  
  has_attached_file :image,
    :default_url => "/uploads/albums/:attachment/missing_:style.png",
    :url    => "/uploads/albums/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/albums/:id/:style/:basename.:extension",
    :styles => {:small => "55x55#", :medium => "100x100#", :large => "400x400#"}      


end
