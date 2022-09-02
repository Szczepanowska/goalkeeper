class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  CATEGORIES = [
    { name: 'Lifestyle', url: 'https://cdn-icons-png.flaticon.com/512/8317/8317218.png' },
    { name: 'Hobbys', url: 'https://cdn-icons-png.flaticon.com/512/8149/8149089.png' },
    { name: 'Career', url: 'https://cdn-icons-png.flaticon.com/512/8062/8062272.png' },
    { name: 'Education', url: 'https://cdn-icons-png.flaticon.com/512/4645/4645229.png' },
    { name: 'Selfdevelopement', url: 'https://cdn-icons-png.flaticon.com/512/6186/6186537.png' },
    { name: 'Sport', url: 'https://cdn-icons-png.flaticon.com/512/7942/7942528.png' },
    { name: 'Finances', url: 'https://cdn-icons-png.flaticon.com/512/8176/8176424.png' },
    { name: 'Health', url: 'https://cdn-icons-png.flaticon.com/512/8317/8317480.png' }
  ]
  validates :category, inclusion: { in: CATEGORIES.map { |category| category[:name] } }

  def category_url
    Goal::CATEGORIES.find { |c| self.category == c[:name] }[:url]
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
