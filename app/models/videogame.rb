class Videogame < ApplicationRecord
  has_many :scores
  has_one :sale
  has_and_belongs_to_many :wishlists

  enum platform: %i[ atari_2600 nintendo_3ds new_nintendo_3ds nintendo_ds nintendo_dsi game_boy game_boy_color game_boy_advance gamecube genesis nintendo_64 nintendo_64dd nes neogeo playstation playstation_2 playstation_3 playstation_4 playstation_portable playstation_vita saturn super_nes turbografx-16 wii wii_u wonderswan wonderswan_color xbox_360 xbox xbox_one ]
  enum genre: %i[ sports platform racing role_playing puzzle misc shooter simulation action fighting adventure strategy ]
  enum editorschoice: %i[ n y]
  enum rating: %i[ ao e10+ e ec k_a m rp t ]

  def self.search(query)
    where("lower(name) LIKE lower(?)", "%#{query}%")
  end
end