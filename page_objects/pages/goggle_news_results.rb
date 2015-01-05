require 'singleton'
class GoogleNewsResults < SitePrism::Page
  include Singleton

  attr_reader :first_news_result_url

  set_url "/{?query*}"
  set_url_matcher /^https:\/\/google\.com\/\?nws$/

  elements :query_news_results, "#rso li a[href]"
  # "#rso li:nth-child(2) div div._cnc h3 a"

  def click_first_news_result
    # @first_news_result_href = news_results.first[:href]
    # @first_news_result_url = first_news_result_href.gsub(/(http:\/\/)/, "")
    # @first_news_result_href.click
    @first_news_result_url = query_news_results.first[:href].gsub(/(http:\/\/)/, "")
    query_news_results.first.click
  end

end