module ApplicationHelper
  def body_class(extra = nil)
    classes = [params[:controller], "#{params[:controller]}-#{params[:action]}"]
    
    unless extra.blank?
      classes.push extra
    end

    classes.map! { |c| slashes_to_dash c }

    classes.join ' '
  end

  def body_id
    "page-#{slashes_to_dash params[:controller]}"
  end

  def full_title(page_title)
    base_title = 'whalesalad'
    
    return "#{page_title.downcase} &mdash; #{base_title}".html_safe unless page_title.empty?
    
    base_title
  end

  def awesome_icon(icon, extra_class=nil)
    unless extra_class.nil?
      extra_class = " #{exra_class}"
    end
    "<i class=\"awesome-icon icon-#{icon}#{extra_class}\"></i>".html_safe
  end

  private

  def slashes_to_dash(value)
    value.gsub(/\//, '-')
  end

end
