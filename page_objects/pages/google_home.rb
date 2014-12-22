#Hint: This should model the initial page for google that the initial search is performed on
class GoogleHome < SitePrism::Page

  #Hint: declare the url necessary to load this page
  set_url 'https://www.google.com'

  #Hint: define elements here like so
  # element :some_element, 'some_css_selector'
  element :search_field, "#gbqfq"
  element :search_button, "#gbqfb"

  #Hint: define methods here, like so
  def get_search_field
    search_field.value
  end

  def set_search_field(text)
    search_field.set text
  end

  def click_search_button
    search_button.click
  end

end