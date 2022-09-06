class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  CATEGORIES = [
    { name: 'Lifestyle', url: 'https://cdn-icons-png.flaticon.com/512/706/706204.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504004.png' },
    { name: 'Hobbies', url: 'https://cdn-icons-png.flaticon.com/512/4615/4615367.png',
      ulr2: 'https://cdn-icons-png.flaticon.com/512/7504/7504017.png' },
    { name: 'Career', url: 'https://cdn-icons-png.flaticon.com/512/8062/8062272.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504092.png' },
    { name: 'Education', url: 'https://cdn-icons-png.flaticon.com/512/4645/4645229.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7503/7503970.png' },
    { name: 'Growth', url: 'https://cdn-icons-png.flaticon.com/512/6186/6186537.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504051.png' },
    { name: 'Sports', url: 'https://cdn-icons-png.flaticon.com/512/1198/1198314.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504065.png' },
    { name: 'Finances', url: 'https://cdn-icons-png.flaticon.com/512/8176/8176424.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504038.png' },
    { name: 'Health', url: 'https://cdn-icons-png.flaticon.com/512/4310/4310163.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7503/7503990.png' }
  ]
  validates :category, inclusion: { in: CATEGORIES.map { |category| category[:name] } }

  def category_url
    Goal::CATEGORIES.find { |c| self.category == c[:name] }[:url]
  end

  def category_url_badge
    Goal::CATEGORIES.find { |c| self.category == c[:name] }[:url2]
  end

  def completed_tasks
    self.tasks.completed
  end

  def progress
    if self.tasks.empty?
      0
    else
      self.completed_tasks.count.fdiv(self.tasks.count)
    end
  end
end
