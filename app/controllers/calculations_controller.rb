class CalculationsController < ApplicationController
  def calc_square
    ### params: {"user_number" => "80"}
    the_number = params["user_number"].to_i
    the_square = the_number**2
    render({ 
      :template => "calc_templates/show_square.html.erb",
      :locals => {
        :input => the_number,
        :result => the_square
        }
    })
  end
  
  def calc_square_root
    the_number = params["user_number"].to_i
    the_sqrt = the_number**(0.5)
    render({ 
      :template => "calc_templates/show_sqrt.html.erb",
      :locals => {
        :input => the_number,
        :result => the_sqrt
        }
    })
  end
  
  def calc_payment
     @bp = params["basis_points"].to_f
     @years = params["number_of_years"].to_f
     @principal = params["present_value"].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
 
    r = (@bp / 10000.0) / 12.0
    x = (1+r)**(@years*12)
    m = (@principal*r*x)/(x-1)

    @monthly_payment = m
    render({ 
      :template => "calc_templates/show_payment.html.erb",

    })
  end
  
  # ------- Square Form --------
  
  def square_form
    render("calc_templates/square_form.html.erb")
  end
  
  def process_square_form
    @the_number = params["user_number"].to_f
    @the_square = @the_number**2.0
    render("calc_templates/square_results.html.erb")
  end
  
  # ----- Square Root Form ---------
  
  def square_root_form
    render("calc_templates/sqrt_form.html.erb")
  end
  
  def process_sqrt_form
    @the_number = params["user_number"].to_f
    @the_root = @the_number**(0.5)
    render("calc_templates/sqrt_results.html.erb")
  end  
  
  
    # ----- Payment Form ---------
  
  def payment_form
    render("calc_templates/payment_form.html.erb")
  end
  
  def process_payment_form
     
     #Get input
     @apr = params["user_apr"].to_f
     @years = params["user_years"].to_f
     @principal = params["user_principal"].to_f
     
     #Calculations
    r = (@apr / 100.0) / 12.0
    x = (1+r)**(@years*12)
    @monthly_payment = (@principal*r*x)/(x-1)

    render("calc_templates/payment_results.html.erb")
  end  

  #------ Random Form --------
  
  def random_form
    render("calc_templates/random_form.html.erb")
  end
  
  def process_random_form
    @minimum = params["user_min"].to_f
    @maximum = params["user_max"].to_f
    
    @rand = rand(@minimum...@maximum)
   # @rand = r.round(4)
    
    render("calc_templates/random_results.html.erb")
  end
  
  
end