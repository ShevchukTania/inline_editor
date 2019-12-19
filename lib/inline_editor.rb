require "inline_editor/engine"

module InlineEditor
  module ApplicationHelper
    def inline_editor(as: '', id: '', text: '', collection: '', active: '', include_blank: '', save_url: '', attribute: '', model: '')
      render 'inline_editor/inline_editor', as: as, id: id, text: text, collection: collection, active: active,
        include_blank: include_blank, save_url: save_url, attribute: attribute, model: model
    end
  end
end
