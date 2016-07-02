class Comment < ApplicationRecord
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many   :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  has_many   :likes
  belongs_to :user

  validates :content, presence: true
  validates :user_id, presence: true

  def root?
    parent.nil?
  end

  def self.root
    where(parent_id: nil)
  end

  def not_like_by?(user)
    likes.where(user_id: user.id).blank?
  end

  def count_liked
    likes.count
  end
end
