module InlineEditor
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace InlineEditor

      initializer 'inline_editor.assets_precompile', group: :all do |app|
        app.config.assets.precompile += ['inline_editor/inline_editor.js', 'inline_editor/inline_editor.css']
      end

      initializer 'inline_editor.helpers' do
        ActiveSupport.on_load :action_view do
          ActionView::Base.send :include, InlineEditor::ApplicationHelper
        end
      end
    end
  end
end