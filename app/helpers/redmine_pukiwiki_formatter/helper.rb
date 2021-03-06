module RedminePukiwikiFormatter
  module Helper
    unloadable

    def wikitoolbar_for(field_id)
      file = Engines::RailsExtensions::AssetHelpers.plugin_asset_path('redmine_pukiwiki_formatter', 'help', 'pukiwiki_syntax.html')
      help_link = l(:setting_text_formatting) + ': ' +
      link_to(l(:label_help), file,
              :onclick => "window.open(\"#{file}\", \"\", \"resizable=yes, location=no, width=300, height=640, menubar=no, status=no, scrollbars=yes\"); return false;")

      javascript_include_tag('jstoolbar/jstoolbar') +
        javascript_include_tag('pukiwiki', :plugin => 'redmine_pukiwiki_formatter') +
        javascript_include_tag("lang/pukiwiki-#{current_language}", :plugin => 'redmine_pukiwiki_formatter') +
        javascript_tag("var toolbar = new jsToolBar($('#{field_id}')); toolbar.setHelpLink('#{help_link}'); toolbar.draw();")
    end

    def initial_page_content(page)
      "* #{page.pretty_title}\n\n"
    end

    def heads_for_wiki_formatter
      stylesheet_link_tag('jstoolbar') +
        stylesheet_link_tag('pukiwiki', :plugin => 'redmine_pukiwiki_formatter')
    end
  end
end
