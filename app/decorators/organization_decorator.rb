module OrganizationDecorator
  def render_create_or_destroy_link
    if id.present?
      return link_to 'OFF', organization_path(id: id), class: %W(btn btn-danger), method: :delete
    end

    link_to 'ON', organizations_path(id: id, organization_id: organization_id, name: name), class: %W(btn btn-primary), method: :post
  end
end
