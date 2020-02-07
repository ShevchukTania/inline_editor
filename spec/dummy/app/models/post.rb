class Post < ApplicationRecord
  ABOUT = ['first', 'second', 'third']
  TITLE_ATTR = ['first title', 'second title', 'third title']
  TITLE = TITLE_ATTR + ['title with error']

  ABOUT_GROUPED = {
    "Nature": [
       'Places reviews',
       'Ecology',
       'Travels'
     ],
  "Technologies": [
     'News',
     'Research',
     'Dadget reviews',
     '“How to” and “why”'
   ],
  "Home": [
     'Maintenance hacks',
     'Landscaping',
     'Cooking',
     'Construction'
   ],
   "Culture": [
      'Arts',
      'Music',
      'Politics',
      'Places'
    ]
}

  validates :title, :body, presence: true
  validates :title, inclusion: { in: TITLE_ATTR,
    message: "%{value} is not a valid title" }
end
