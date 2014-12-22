#Hint: This should model the google search results page
class GoogleSearchResults < SitePrism::Page

  #Hint: declare a url matcher that would return true for this page's url
  set_url "/\?query*$/"
  set_url_matcher /^https:\/\/google\.com\/\?query*$/

  element :search_field, "#gbqfq"
  element :news_tab, "#hdtb_msb div:nth-child(5) a"

  def click_news_tab
    news_tab.click
  end

end

