class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def total_likes
    posts.sum(:likes)
  end

  def featured_post
    {title: posts.order(likes: :desc).limit(1).pluck(:title)[0],
    id: posts.order(likes: :desc).limit(1).pluck(:id)[0],
    content: posts.order(likes: :desc).limit(1).pluck(:content)[0]}
  end

end
