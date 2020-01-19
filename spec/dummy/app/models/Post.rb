class Post < ApplicationRecord
  ABOUT = ['first', 'second', 'third']
  TITLE = ['first title', 'second title', 'third title']

  validates :title, :body, presence: true
end
