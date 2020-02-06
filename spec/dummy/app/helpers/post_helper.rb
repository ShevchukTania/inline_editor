module PostHelper
  def inline_editor_text(params)
    if params.keys[0] == 'title'
      render 'inline_edit_value', label: params.keys[0] , value: params.values[0]
    else
      params.values[0]
    end
  end
end
