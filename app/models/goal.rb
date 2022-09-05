class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  CATEGORIES = [
    { name: 'Lifestyle', url: 'https://cdn-icons-png.flaticon.com/512/8317/8317218.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504004.png' },
    { name: 'Hobbys', url: 'https://cdn-icons-png.flaticon.com/512/8149/8149089.png',
      ulr2: 'https://cdn-icons-png.flaticon.com/512/7504/7504017.png' },
    { name: 'Career', url: 'https://cdn-icons-png.flaticon.com/512/8062/8062272.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504092.png' },
    { name: 'Education', url: 'https://cdn-icons-png.flaticon.com/512/4645/4645229.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7503/7503970.png' },
    { name: 'Selfdevelopement', url: 'https://cdn-icons-png.flaticon.com/512/6186/6186537.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504051.png' },
    { name: 'Sport', url: 'https://cdn-icons-png.flaticon.com/512/7942/7942528.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504065.png' },
    { name: 'Finances', url: 'https://cdn-icons-png.flaticon.com/512/8176/8176424.png',
      url2: 'https://cdn-icons-png.flaticon.com/512/7504/7504038.png' },
    { name: 'Health', url: 'https://cdn-icons-png.flaticon.com/512/8317/8317480.png',
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

  # def completed_goals
  #   self.status = "completed" if self.completed_tasks == 1
  # end
end
