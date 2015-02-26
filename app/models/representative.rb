require_relative '../../db/config'

class Representative < ActiveRecord::Base
  belongs_to :legislator

  def self.show
    @temp_representative = []
    Legislator.where('title = ?', 'Rep').each do |x|
      @temp_representative << "#{x.full_name} (#{x.party})"
    end
  end

  def self.active_in_office
    @temp_representative = []
    Legislator.where('title = ?', 'Rep').where('in_office = ?', '1').each do |x|
      @temp_representative << "#{x.full_name} (#{x.party})"
    end
  end
end

