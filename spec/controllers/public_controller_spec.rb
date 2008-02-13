require File.dirname(__FILE__) + '/../spec_helper'

describe PublicController do
  before(:each) do
    request.host = 'slate.example.com'
    @space = mock(Space)
  end
  
  it "should find space for domain 'slate.example.com' on GET to /index" do
    Space.should_receive(:find_by_domain).with('slate.example.com').
      and_return(@space)
      
    @space.should_receive(:to_yaml).and_return('')
      
    get 'index', :page_path => ['/']
    response.should be_success
    response.body.should include('TODO') 
  end
end