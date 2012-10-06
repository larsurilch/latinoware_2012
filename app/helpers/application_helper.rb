module ApplicationHelper
  def title
    base_title = I18n.t("default_title").upcase
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title.mb_chars.capitalize}"
    end
  end
  
  def flash_message
    messages = ""
    [:notice, :warning, :alert].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }
    messages
  end
end