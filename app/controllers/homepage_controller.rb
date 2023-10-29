class HomepageController < ApplicationController
  def landing
    render({:template=>"home_templates/homepage"}) #note: don't need to include .html.erb tag
  end
end
