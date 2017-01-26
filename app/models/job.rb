class Job < ApplicationRecord
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('updated_at DESC') }
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
  validates :people, numericality: { greater_than: 0 }
  has_many :resumes

  def hide!
    self.is_hidden = true
    self.save
  end

  def publish!
    self.is_hidden = false
    self.save
  end
end
