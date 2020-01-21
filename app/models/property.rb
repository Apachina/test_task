class Property < ApplicationRecord
  validates :name, presence: true

  has_many :units, :dependent => :destroy
end
