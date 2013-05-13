class Contact
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :subject, :body

  validates :name, :presence => true
  validates :email, :presence => true
  validates :subject, :presence => true
  validates :body, :presence => true

  def initialize(attrs = {})
    @attributes = attrs
    write_attributes
  end

  def persisted?
    false
  end

  def mail
    ContactMailer.inquiry(self).deliver
  end

  private
  attr_reader :attributes

  def write_attributes
    attributes.each do |name, value|
      instance_variable_set :"@#{name.to_s}", value
    end
  end
end
