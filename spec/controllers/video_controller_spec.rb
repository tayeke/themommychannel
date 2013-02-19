require 'spec_helper'

describe VideoController do

  describe "GET 'category'" do
    it "returns http success" do
      get 'category'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
