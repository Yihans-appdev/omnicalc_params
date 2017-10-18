Rails.application.routes.draw do
  get("/flexible/square/:user_number", { :controller => "calculations", :action => "calc_square"})
  get("/flexible/square_root/:user_number", { :controller => "calculations", :action => "calc_square_root"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value", { :controller => "calculations", :action => "calc_payment"})
  
## Forms
#Square
  get("/square/new", { :controller => "calculations", :action => "square_form"})
  get("/square/results", { :controller => "calculations", :action => "process_square_form"})


end
