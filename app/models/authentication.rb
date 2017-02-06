class Authentication < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user, dependent: :destroy
end
