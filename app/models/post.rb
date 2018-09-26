class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination
  validates :title, presence: true
  validates :content, presence: true

  def blogger_name
    blogger.name
  end

  def destination_name
    destination.name
  end
  
end
