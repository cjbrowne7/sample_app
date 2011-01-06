module ApplicationHelper

  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
  # Return a title on a per-page basis
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def char_length_warning(field_id, update_id, max_characters, options = {})
    function = "var out = [];
      var remaining_chars = $(#{max_characters}) - $F('#{field_id}').length;
      if (remaining_chars >= 0) {
          out = remaining_chars;
          document.getElementById('#{field_id}').style.backgroundColor='white'
        } else {
          out = 'Your micropost exceeds the limit by ' + remaining_chars;
          document.getElementById('#{field_id}').style.backgroundColor='red'
        }
        $('#update_id}').innerHTML = out;"
    out = javascript_tag(function)
    out += observe_field(field_id, options.merge(:function => function))
  end
    
    
end