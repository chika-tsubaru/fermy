class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :quest, optional: true
  validates :plan, presence: true, uniqueness: true
  validates :text, presence: true, uniqueness: true
end
