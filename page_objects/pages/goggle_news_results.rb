#Hint: This should model the page that results when you click News from the initial search results page
class GoogleNewsResults < SitePrism::Page

  #Hint: declare a url matcher that would return true for this page's url
  # set_url_matcher /^https:\/\/google\.com\/\?the_rest_of_the_url$/

  #Hint: define elements here like so
  # element :some_element, 'some_css_selector'

  #Hint: define methods here, like so
  # def set_some_element(text)
  #   some_element.set text
  # end

end