module ApplicationHelper
  def github_aouth_link(text)
    link_to auth_at_provider_path(provider: :github), class: %w(btn btn-lg btn-default btn-block) do
      fa_icon 'github 2x', text: text
    end
  end
end
