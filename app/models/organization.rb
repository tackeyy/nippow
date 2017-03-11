class Organization < ApplicationRecord
  acts_as_paranoid

  has_many :repositories

  def self.all_with_pulls(current_client)
    pull_arry = []
    all.each do |organization|
      repos = current_client.repos(organization.name)
      pulls.each do |pull|
        # next if current_user.name != pull[:user][:login]
        # ここUTCに合わせる
        # next if pull[:created_at] > Date.current
        pull_arry.push(pull)
      end
    end
    pull_arry
  end

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
