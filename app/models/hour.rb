class Hour< ApplicationRecord

  #Associations
  has_many_attached :images

  #Validations
  validates :date, presence: true
  validates :task, presence: true
  validates :hours, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :minutes, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
end
