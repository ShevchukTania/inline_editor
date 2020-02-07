module PostHelper
  def inline_editor_text(value: '-', option: '')
    if option == 'about'
      content_tag(:div, class: 'with-label') do
        concat content_tag(:span, value)
        concat content_tag(:span, post_about_group(value), class: 'label')
      end
    else
      value
    end
  end

  def post_about_group(about)
    Post::ABOUT_GROUPED.each do |key, value|
      return key.to_s if value.include?(about)
    end
    return ''
  end
end
