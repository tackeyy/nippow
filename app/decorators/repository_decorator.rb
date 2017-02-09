module RepositoryDecorator
  def render_create_or_destroy_link
    if id.present?
      return link_to 'OFF', repository_path(id: id), class: %W(btn btn-danger), method: :delete
    end

    link_to 'ON', repositories_path(id: id, organization_id: organization_id, repo_id: repo_id, name: name), class: %W(btn btn-primary), method: :post
  end
end
