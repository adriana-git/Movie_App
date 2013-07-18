class Movie < ActiveRecord::Base

	validates :title, :description, :year, :rating, presence: true
  	validates :description, length: { minimum: 10 }
  	validates_numericality_of :rating, :greater_than => 0, :less_than_or_equal_to => 5

  def self.search_for(query)
    Movie.where("title LIKE :query OR description LIKE :query", {:query => "%#{query}%"})
  end

end