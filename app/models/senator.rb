require_relative '../../db/config'

class Senator < ActiveRecord::Base
  belongs_to :legislator

  def self.show
    @senator_array = []
    Legislator.where('title = ?', 'Sen').each do |x|
      @senator_array << "#{x.full_name} (#{x.party})"
    end
  end


  def self.active_in_office
    @senator_array = []
    Legislator.where('title = ?', 'Sen').where('in_office = ?', '1').each do |x|
      @senator_array << "#{x.full_name} (#{x.party})"
    end
  end
end