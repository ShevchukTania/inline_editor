class Post < ApplicationRecord
  ABOUT = ['first', 'second', 'third']
  
  validates :title, :body, :about, presence: true
end
