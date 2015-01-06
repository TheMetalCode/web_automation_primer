class TabSections < SitePrism::Section
 element :web_results_tab, "#hdtb_msb div:nth-child(1) a"
  element :images_results_tab, "#hdtb_msb div:nth-child(2) a"
  element :videos_results_tab, "#hdtb_msb div:nth-child(3) a"
  element :shopping_results_tab, "#hdtb_msb div:nth-child(4) a"
  element :news_results_tab, "#hdtb_msb div:nth-child(5) a" #"#rso li:nth-child(2) div div._cnc h3 a"
  element :maps_results_tab, "#hdtb_more_mn div:nth-child(1) a"
  element :books_results_tab, "#hdtb_more_mn div:nth-child(2) a"
  element :flights_results_tab, "#hdtb_more_mn div:nth-child(3) a"
  element :apps_results_tab, "#hdtb_more_mn div:nth-child(4) a"
end