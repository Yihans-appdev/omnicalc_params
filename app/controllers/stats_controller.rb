class StatsController < ApplicationController
  def stats_form
    render("/calc_templates/stats_form.html.erb")
  end
  
  def process_stats_form
    
    @numbers = params[:user_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min
    
    center = @numbers.count / 2
    if @numbers.count.even?
      @median = (@numbers.sort[center] + @numbers.sort[center-1])/2
    else 
      @median = @numbers.sort[center.floor]
    end 
    
    x=0
    @numbers.each do |num|
      x=x+num
    end    
    @sum = x

    @mean = x / (@numbers.count)

    x=0
    @numbers.each do |num|
      x=x+(num - @mean)**2
    end  
    @variance = x/@count

    @standard_deviation = @variance**(1.0/2.0)

    unique = @numbers.uniq
    mode_table = {}
    x=0
    unique.each do |num|
      mode_table[num] = @numbers.count(num)
    end  
    
    x = mode_table.values.max
    
    @mode = mode_table.key(x)
    
    render("/calc_templates/stats_results.html.erb")
  end
end