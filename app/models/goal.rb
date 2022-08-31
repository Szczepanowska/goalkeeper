class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :likes, dependent: :destroy
  CATEGORIES = [
    { name: 'Lifestyle', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Hobbys', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Career', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Education', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Selfdevelopement', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Sport', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Finances', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' },
    { name: 'Health', url: 'https://cdn-icons-png.flaticon.com/512/8260/8260455.png' }
  ]
  validates :category, inclusion: { in: CATEGORIES.map { |category| category[:name] } }
end
