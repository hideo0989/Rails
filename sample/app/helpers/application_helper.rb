module ApplicationHelper
  # ページごとの完全なタイトルを返します。
 def full_title(page_title = '')
   #この記法だとfull_titleとしても良い
   # def full_title(page_title)
   # この記法だとfull_title('')でないと使えない
   base_title = "Ruby on Rails Tutorial Sample App"
   if page_title.empty?
     base_title
   else
     page_title + " | " + base_title
   end
 end
end
