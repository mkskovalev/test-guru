module SessionsHelper
  def flash_message
    if flash
      flash.map do |key, msg|
        content_tag :p, msg, :class => 'flash alert'
      end.join.html_safe
    end
  end
end
