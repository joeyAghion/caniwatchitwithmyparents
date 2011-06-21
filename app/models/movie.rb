class Movie < ActiveRecord::Base
  def self.find_matching(s)
    self.where("name LIKE ?", "%#{s}%").limit(10)
  end
end
