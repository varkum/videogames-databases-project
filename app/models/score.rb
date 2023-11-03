class Score < ApplicationRecord
  belongs_to :videogame

  enum rater: %i[ ign critic user ]
end
