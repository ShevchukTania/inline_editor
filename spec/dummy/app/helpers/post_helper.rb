module PostHelper
  def inline_editor_text(params)
    value = params.values[0]
    content_tag :span, value
  end
end
