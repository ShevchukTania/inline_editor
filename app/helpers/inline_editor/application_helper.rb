module InlineEditor
  module ApplicationHelper
    extend ActiveSupport::Concern

    def inline_editor
      render 'inline_editor/inline_editor'
    end
  end
end
