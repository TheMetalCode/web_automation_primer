#Hint: This should model the page that results when you click News from the initial search results page
class GoogleNewsResults < SitePrism::Page

  #Hint: declare a url matcher that would return true for this page's url
  set_url "/{?query*}"
  set_url_matcher /^https:\/\/google\.com\/\?nws$/

  #Hint: define elements here like so
  element :first_news_result, "#rso li:nth-child(2) div div._cnc h3 a"

  #Hint: define methods here, like so
  def click_first_news_result
    first_news_result.click
  end

  def get_first_news_result_url
    first_news_result.value
  end
end