require 'singleton'

class GoogleSearchResults < SitePrism::Page
  include Singleton

  attr_reader :first_search_result_url

  set_url "/\?query*$/"
  set_url_matcher /^https:\/\/google\.com\/\?query*$/

  element :search_field, "#gbqfq"
  #element :first_search_result, "#rso div.srg:nth-child(4) li:nth-child(1) div:nth-child(1) h3:nth-child(1) a:nth-child(1)"
  elements :query_search_results, "#rso div.srg li div h3 a:nth-child(1)"
  # element :news_tab, "#hdtb_msb div:nth-child(5) a"
  section :tab_sections, TabSections, "#hdtb_msb"

  def click_news_tab
    tab_sections.news_results_tab.click
  end

  def click_first_search_result
    @first_search_result_url = query_search_results.first[:href].gsub(/(http:\/\/)/, "")
    query_search_results.first.click
  end

end