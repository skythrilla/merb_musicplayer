require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a song exists" do
  Song.all.destroy!
  request(resource(:songs), :method => "POST", 
    :params => { :song => { :id => nil }})
end

describe "resource(:songs)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:songs))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of songs" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a song exists" do
    before(:each) do
      @response = request(resource(:songs))
    end
    
    it "has a list of songs" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Song.all.destroy!
      @response = request(resource(:songs), :method => "POST", 
        :params => { :song => { :id => nil }})
    end
    
    it "redirects to resource(:songs)" do
      @response.should redirect_to(resource(Song.first), :message => {:notice => "song was successfully created"})
    end
    
  end
end

describe "resource(@song)" do 
  describe "a successful DELETE", :given => "a song exists" do
     before(:each) do
       @response = request(resource(Song.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:songs))
     end

   end
end

describe "resource(:songs, :new)" do
  before(:each) do
    @response = request(resource(:songs, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@song, :edit)", :given => "a song exists" do
  before(:each) do
    @response = request(resource(Song.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@song)", :given => "a song exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Song.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @song = Song.first
      @response = request(resource(@song), :method => "PUT", 
        :params => { :song => {:id => @song.id} })
    end
  
    it "redirect to the song show action" do
      @response.should redirect_to(resource(@song))
    end
  end
  
end

