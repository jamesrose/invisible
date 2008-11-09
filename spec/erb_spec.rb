require File.dirname(__FILE__) + "/spec_helper"
require "invisible/erb"

describe "erb" do
  before do
    @app = Invisible.new do
      root File.dirname(__FILE__) + "/fixtures"
      get "/text" do
        @ohaie = "ivar"
        render erb(:ohaie)
      end
    end
  end
  
  it "should render erb template" do
    @app.mock.get("/text").body.should == "[ivar]"
  end
end
