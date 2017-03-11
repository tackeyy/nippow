class Repository < ApplicationRecord
  acts_as_paranoid

  belongs_to :organization

  def self.github_repos(github_repos)
    return [] if github_repos.blank?

    result = []
    repos = all
    github_repos.each do |github_repo|
      repo = repos.find { |r| r.repo_id == github_repo.id }
      result.push(
        new(
          id: repo.try(:id),
          organization_id: github_repo[:owner][:id],
          repo_id: github_repo.id,
          name: github_repo.full_name
        )
      )
    end
    result.sort_by(&:name)
  end
end
