class Book < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :sales

  has_attached_file :image
  has_attached_file :resource

  validates_attachment_content_type :image,
                                    content_type:  /^image\/(png|gif|jpeg)/,
                                    message: 'Only images allowed'

  validates_attachment_content_type :resource,
                                    content_type: ['application/pdf'],
                                    message: 'Only pdfs allowed'


  validates_attachment_presence :image, :resource

  validates_numericality_of :price, greater_than: 0.49, message: 'Must be at least 0.50 dollars'

end
