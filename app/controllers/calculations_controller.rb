class CalculationsController < ApplicationController
  def square_new
    #pp params
    render({:template=>"home_templates/homepage"}) #note: don't need to include .html.erb tag
  end
  def square_results
    @input = params.fetch("user_number")
    @output = (@input.to_f**2)
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
  ################################################################
  def payment_new
    #pp params
    render({:template=>"home_templates/payment"}) #note: don't need to include .html.erb tag
  end
  def payment_results
    def format_currency_with_commas(amount)
      parts = sprintf("%.2f", amount).split('.')
      parts[0].gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
      "$#{parts.join('.')}"
    end
  
    @the_apr = params.fetch("user_apr").to_f/100
    @formatted_percentage = sprintf("%.4f%%", @the_apr * 100)
  
    @the_years = params.fetch("user_years").to_i
  
    @the_principal = params.fetch("user_pv").to_f
    @formatted_principal = sprintf("$%.2f", @the_principal)
  
  
    def calculate_monthly_payment(apr, years_remaining, present_value)
      monthly_interest_rate = (@the_apr) / 12
      total_number_of_payments = @the_years * 12
    
      if monthly_interest_rate == 0
        monthly_payment = present_value / total_number_of_payments
      else
        monthly_payment = present_value * (monthly_interest_rate * (1 + monthly_interest_rate) ** total_number_of_payments) / ((1 + monthly_interest_rate) ** total_number_of_payments - 1)
      end
    
      return monthly_payment
    end
  
    @the_payment = calculate_monthly_payment(@the_apr, @the_years, @the_principal)
    @formatted_payment = format_currency_with_commas(@the_payment)
    render({:template=>"calculations_templates/payment_output"})
  end
  ################################################################
  def random_new
    #pp params
    render({:template=>"home_templates/random"}) #note: don't need to include .html.erb tag
  end
  def random_results
    @min_input = params.fetch("user_min").to_f
    @max_input = params.fetch("user_max").to_f

    def random_number(min, max)
      if min.is_a?(Numeric) && max.is_a?(Numeric)
        rand * (max - min) + min
      else
        raise ArgumentError, "Both 'min' and 'max' must be numeric values."
      end
    end

    @output = random_number(@min_input, @max_input)

    render({:template=>"calculations_templates/random_output"}) #note: don't need to include .html.erb tag
  end  
end
