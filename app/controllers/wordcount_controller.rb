class WordcountController < ApplicationController


  #------- Word Count ---------------
  
  def wordcount_form
    render("calc_templates/wordcount_form.html.erb")
  end
  
  def process_wordcount_form
    
    @text = params["user_text"]
    @special_word = params["user_word"]
    
    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/, "").length

    x=0

    @text.split.each do |word|
      if word.downcase.gsub(/[^a-z0-9\s]/i, "")==@special_word.downcase
        x+=1
      end
    end
    @occurrences = x
    
    render("calc_templates/wordcount_results.html.erb")
  end
  
end