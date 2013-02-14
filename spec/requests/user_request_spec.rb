require 'spec_helper'

describe "user http request" do
  it "show all users" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get '/users'
    expect(response.status).to eq(200)
  end
end
