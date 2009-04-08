class Artist
  include DataMapper::Resource
  include Paperclip::Resource
                               
  property :id, Serial
  property :name, String, :nullable => false
  property :bio, Text
  property :external_links, URI
  
  # has n, :albums
          
  has_attached_file :image,
    :default_url => "/uploads/artists/:attachment/missing_:style.png",
    :url    => "/uploads/artists/:id/:style/:basename.:extension",
    :path   => ":merb_root/public/uploads/artists/:id/:style/:basename.:extension",
    :styles => {:small => "55x55#", :medium => "100x100#", :large => "300x300#"}      
    

end
