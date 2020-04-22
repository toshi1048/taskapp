class Task < ApplicationRecord
  paginates_per 10
  has_one_attached :image
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  #before_validation :set_nameless_name
  
  
  validates :name, presence: true,length: { maximum: 30 }
  #validates :validate_name_not_including_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  private

  #def set_nameless_name
  #self.name = '名前なし' if name.blank?
  #end

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることができません') if name&.include?(',')
  end
end
