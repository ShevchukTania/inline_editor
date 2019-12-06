module InlineEditor
  module Rails
    class Engine < ::Rails::Engine
      initializer 'inline_editor.assets_precompile', group: :all do |app|
        app.config.assets.precompile += ['inline_editor/inline_editor.js', 'inline_editor/inline_editor.css']
      end
    end
  end
end
