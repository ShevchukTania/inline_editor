require "inline_editor/engine"

module InlineEditor
  module ApplicationHelper
    def inline_editor(as: '', text: '', collection: '', value: '', include_blank: '', save_url: '', attribute: '')
      render 'inline_editor/inline_editor', as: as, text: text, collection: collection, value: value,
        include_blank: include_blank, save_url: save_url, attribute: attribute
    end
  end
end
