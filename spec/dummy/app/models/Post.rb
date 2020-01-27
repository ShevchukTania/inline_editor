class Post < ApplicationRecord
  ABOUT = ['first', 'second', 'third']
  TITLE_ATTR = ['first title', 'second title', 'third title']
  TITLE = TITLE_ATTR + ['sxcfg']

  validates :title, :body, presence: true
  validates :title, inclusion: { in: TITLE_ATTR,
    message: "%{value} is not a valid title" }
end
