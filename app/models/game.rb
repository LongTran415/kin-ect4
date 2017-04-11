class Game < ApplicationRecord
  has_many :comments
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :votes, as: :votable

  belongs_to :category

  delegate :name, to: :category, prefix: true, allow_nil: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scope :games, -> { where(title: "%#{search}%") }
    end
  end
end
