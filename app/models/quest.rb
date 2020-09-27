class Quest < ApplicationRecord
  has_many :answers
  validates :title, presence: true
end
