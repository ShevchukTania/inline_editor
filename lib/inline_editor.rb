require "inline_editor/engine"

module InlineEditor
  module ApplicationHelper
    def inline_editor(as: '', text: '', collection: '', active: '', include_blank: '', save_url: '')
      render 'inline_editor/inline_editor', as: as, text: text, collection: collection, active: active,
        include_blank: include_blank, save_url: save_url
    end
  end
end
