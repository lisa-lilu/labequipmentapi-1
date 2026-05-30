class Category < ApplicationRecord
  has_many :equipment

  validates :name, presence: true, length: { minimum: 3, message: "must be at least 3 characters" }
end