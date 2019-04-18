class Plan < ApplicationRecord
  validates :name, :presence => true
  has_many :entries
  has_many :food, :through => :entries
  accepts_nested_attributes_for :entries, allow_destroy: true
end
