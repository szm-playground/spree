require 'spec_helper'

describe Spree::Core::Rails::RouteExtensions do
  def reload_routes!
    Rails.application.routes_reloader.reload!
  end

  context "just core routes" do
    before do
      Rails.application.routes.prepend do
        spree :only => :core
      end

      Rails.application.routes_reloader.reload!
    end

    it "routes to core" do
      visit '/'
      page.status_code.should == 200
    end
  end
end

