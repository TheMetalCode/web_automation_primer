class Google

  #Hint: This Google class is the only place we will instantiate page objects

  #Hint: This message should return a new instance of GoogleHome
  def home
    GoogleHome.new
  end

  #Hint: This message should return a new instance of GoogleSearchResults
  def search_results
    GoogleSearchResults.new
  end

  #Hint: This message should return a new instance of GoogleNewsResults
  def news_results
    GoogleNewsResults.new
  end
end