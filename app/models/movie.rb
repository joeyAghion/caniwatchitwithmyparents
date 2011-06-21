class Movie < ActiveRecord::Base
  def self.find_matching(s)
    self.where("UPPER(name) LIKE UPPER(?)", "%#{s}%").limit(10)
  end
end
