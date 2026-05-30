class Equipment < ApplicationRecord
  belongs_to :category
  has_many :maintenance_records

  validates :name, presence: true, length: { minimum: 2, message: "must be at least 2 characters" }
  validates :serial_number, presence: true, uniqueness: { message: "must be unique" }
  validate :serial_number_format

  private

  def serial_number_format
    if serial_number.present? && !serial_number.match?(/\A[a-zA-Z0-9]+\z/)
      errors.add(:serial_number, "must be alphanumeric (letters and numbers only, no special characters)")
    end
  end
end