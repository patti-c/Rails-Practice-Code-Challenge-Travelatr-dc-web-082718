class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_five
    posts.order(id: :desc).limit(5).pluck(:title, :id)
  end

  def featured_post
    {title: posts.order(likes: :desc).limit(1).pluck(:title)[0],
    id: posts.order(likes: :desc).limit(1).pluck(:id)[0],
    content: posts.order(likes: :desc).limit(1).pluck(:content)[0]}
  end

  def average_age
    bloggers.average(:age).to_i
  end

end
