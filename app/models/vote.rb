class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  # validates_uniqueness_of :user_id
end
