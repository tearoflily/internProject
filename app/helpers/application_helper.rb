module ApplicationHelper
  def pageTitle(title)
    base_title = "ページ"
    if title.empty?
      base_title
    else
      title + " | " + base_title
    end  
  end
end
