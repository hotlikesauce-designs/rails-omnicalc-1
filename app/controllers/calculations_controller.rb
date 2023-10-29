class CalculationsController < ApplicationController
  def square_new
    #pp params
    render({:template=>"home_templates/homepage"}) #note: don't need to include .html.erb tag
  end
  def square_results
    @output = (params.fetch("user_number").to_f**2)
    render({:template=>"calculations_templates/square_output"}) #note: don't need to include .html.erb tag
  end
  ################################################################
  def square_root_new
    #pp params
    render({:template=>"home_templates/square_root"}) #note: don't need to include .html.erb tag
  end
  def square_root_results
    @input = params.fetch("user_number")
    @output = (@input.to_f**(0.5))
    render({:template=>"calculations_templates/square_root_output"}) #note: don't need to include .html.erb tag
  end
  ################

end
