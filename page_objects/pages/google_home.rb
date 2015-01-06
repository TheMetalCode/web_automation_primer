class GoogleHome < SitePrism::Page

  set_url 'https://www.google.com'

  element :search_field, '#gbqfq'
  element :search_button, "#gbqfb"

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