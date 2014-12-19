#Hint: This should model the page that results when you click News from the initial search results page
class GoogleNewsResults < SitePrism::Page

  #Hint: declare a url matcher that would return true for this page's url
  set_url "/{?query*}"
  set_url_matcher /^https:\/\/google\.com\/\?nws$/

  #Hint: define elements here like so
  # element :search_results_first_link, first("#rso li:nth-child(2) a")['href']

  #Hint: define methods here, like so
  def click_first_search_result
    # search_results_first_link.click
  end

end