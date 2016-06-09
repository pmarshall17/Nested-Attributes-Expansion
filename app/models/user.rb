class User < ActiveRecord::Base
  # Assoications
  has_one :address
  has_many :tasks
  # Validations
  validates_presence_of :email, :first_name, :last_name
  # Callbacks?

  # Nested Attributes
  # has_one
  accepts_nested_attributes_for :address

  # has_many
  accepts_nested_attributes_for :tasks,
    allow_destroy: true,
    reject_if: :all_blank


  def full_name
    "#{first_name} #{last_name}"
  end

  def self.by_last_name
    order(:last_name)
  end
end


validates :city, presence: true, length: {in: 2..30}
