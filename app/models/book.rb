class Book < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name, :author
  validates_numericality_of :price
end
