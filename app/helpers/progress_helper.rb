module ProgressHelper
   def progress_bar(color, width)
    content_tag(:div, "", class: "performance-bar performance-bar-#{color}", style: "width: #{width}px;")
  end
end
