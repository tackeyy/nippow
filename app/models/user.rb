class User < ApplicationRecord
  authenticates_with_sorcery!
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def linked_github?
    authentications.where(provider: 'github').present?
  end
end
