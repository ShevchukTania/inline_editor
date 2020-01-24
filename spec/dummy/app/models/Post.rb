class Post < ApplicationRecord
  ABOUT = ['first', 'second', 'third']
  TITLE = ['first title', 'second title', 'third title']

  validates :title, :body, presence: true
  validates :title, inclusion: { in: TITLE,
    message: "%{value} is not a valid title" }
end
