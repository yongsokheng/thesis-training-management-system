module ApplicationHelper
  def full_title page_title = ""
    base_title = t "staticpages.framgia"
    "#{page_title} | #{base_title}"
  end
end
