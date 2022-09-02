class Kitten < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, presence: true
end
