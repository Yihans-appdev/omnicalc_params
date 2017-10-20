Rails.application.routes.draw do
  get("/flexible/square/:user_number", { :controller => "calculations", :action => "calc_square"})
  get("/flexible/square_root/:user_number", { :controller => "calculations", :action => "calc_square_root"})
  get("/flexible/payment/:basis_points/:number_of_years/:present_value", { :controller => "calculations", :action => "calc_payment"})
  get("/flexible/random/:min/:max", { :controller => "calculations", :action => "calc_random"})
  
## Forms
#Square
  get("/square/new", { :controller => "calculations", :action => "square_form"})
  get("/square/results", { :controller => "calculations", :action => "process_square_form"})

##Square Root
  get("/square_root/new", { :controller => "calculations", :action => "square_root_form"})
  get("/sqrt/results", { :controller => "calculations", :action => "process_sqrt_form"})
  
##Payment
  get("/payment/new", { :controller => "calculations", :action => "payment_form"})
  get("/payment/results", { :controller => "calculations", :action => "process_payment_form"})

##Random
  get("/random/new", { :controller => "calculations", :action => "random_form"})
  get("/random/results", { :controller => "calculations", :action => "process_random_form"})

##Word count
  get("/word_count/new", { :controller => "wordcount", :action => "wordcount_form"})
  get("/word_count/results", { :controller => "wordcount", :action => "process_wordcount_form"})
  
##Stats
  get("/descriptive_stats/new", { :controller => "stats", :action => "stats_form"})
  get("/descriptive_stats/results", { :controller => "stats", :action => "process_stats_form"})


end
