require 'singleton'
class GoogleNewsResults < SitePrism::Page
  include Singleton

  attr_reader :first_news_result_url

  set_url "/{?query*}"
  set_url_matcher /^https:\/\/www\.google\.com\/\#q=.+&tbm=nws$/

  elements :query_news_results, "#rso li a[href]"

  def click_first_news_result
    @first_news_result_url = query_news_results.first[:href].gsub(/(http:\/\/)/, "")
    query_news_results.first.click
  end

end