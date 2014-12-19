#Hint: This should model the google search results page
class GoogleSearchResults < SitePrism::Page

  #Hint: declare a url matcher that would return true for this page's url
  set_url_matcher /^https:\/\/google\.com\/\?query*$/

  element :search_field, "#gbqfq"
  element :news_tab, "[link='News']"
  # sections :menu_tabs, "#hbtb_msb" do
    # element :title, "a.title"
    # element :href,"a.href"
  # end

  def get_search_field_value
    search_field.text
  end

  def click_news_tab
    news_tab.click
  end

end

