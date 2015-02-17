class Book < ActiveRecord::Base

  belongs_to :user

  has_attached_file :image
  has_attached_file :resource


  validates_presence_of :name, :author
  validates_numericality_of :price
end
