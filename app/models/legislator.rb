require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  validates :firstname, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


  def full_name
    "#{firstname} #{lastname}"
  end

end