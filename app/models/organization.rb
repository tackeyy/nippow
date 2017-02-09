class Organization < ApplicationRecord
  acts_as_paranoid

  has_many :repositories

  def self.github_organizations(github_organization)
    return [] if github_organization.blank?

    result = []
    organizations = all
    github_organization.each do |github_org|
      organization = organizations.find { |org| org.organization_id == github_org.id }
      result.push(
        new(
          id: organization.try(:id),
          organization_id: github_org.id,
          name: github_org.login,
        )
      )
    end
    result.sort_by(&:name)
  end
end
