require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/playlist" do
  before(:each) do
    @response = request("/playlist")
  end
  
  it "should be successful" do
    @response.should be_successful
  end
end