require "./spec_helper"

describe "Your::Kemal::App" do

  # You can use get,post,put,patch,delete to call the corresponding route.
  it "renders /" do
    post "/"
    
    response.body.should eq "Hello World!"
  end

end