require 'singleton'

class GoogleSearchResults < SitePrism::Page
  include Singleton

  attr_reader :first_search_result_url

  set_url "/\?query*$/"
  set_url_matcher /^https:\/\/www\.google\.com\/\#q=.+$/

  element :search_field, "#gbqfq"
  elements :query_search_results, "#rso div.srg li div h3 a:nth-child(1)"
  section :tab_sections, TabSections, "#hdtb_msb"

  def click_news_tab
    tab_sections.news_results_tab.click
  end

  def click_first_search_result
    @first_search_result_url = query_search_results.first[:href].gsub(/(http:\/\/)/, "")
    query_search_results.first.click
  end

end