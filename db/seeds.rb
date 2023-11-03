require 'csv' 

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
def normalize_name(name)
  name.strip.downcase
end



ign_platform_to_videogame =
  {
  "Atari 2600": "2600",
  "Nintendo 3DS": "3DS",
  "New Nintendo 3DS": "3DS",
  "Nintendo DS": "DS",
  "Nintendo DSi": "DS",
  "Game Boy": "GB",
  "Game Boy Color": "GB",
  "Game Boy Advance": "GBA",
  "GameCube": "GC",
  "Genesis": "GEN",
  "Nintendo 64": "N64",
  "Nintendo 64DD": "N64",
  "NES": "NES",
  "NeoGeo": "NG",
  "PlayStation": "PS",
  "PlayStation 2": "PS2",
  "PlayStation 3": "PS3",
  "PlayStation 4": "PS4",
  "PlayStation Portable": "PSP",
  "PlayStation Vita": "PSV",
  "Saturn": "SAT",
  "Super NES": "SNES",
  "TurboGrafx-16": "TG16",
  "Wii": "Wii",
  "Wii U": "WiiU",
  "WonderSwan": "WS",
  "WonderSwan Color": "WS",
  "Xbox 360": "X60",
  "Xbox": "XB",
  "Xbox One": "Xone"
  }



ign_csv_text = File.read(Rails.root.join('lib', 'seeds', 'ign.csv'))
ign_csv = CSV.parse(ign_csv_text, headers: true)

videogames_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Video_Games.csv'))
videogames_csv = CSV.parse(videogames_csv_text, headers: true)
count = 0

started_at = Time.now


videogames_csv.each do |videogame_row|
  ign_csv.each do |ign_row|
    if normalize_name(videogame_row['Name']) == normalize_name(ign_row['title']) && ign_platform_to_videogame[ign_row['platform'].to_sym] == videogame_row["Platform"]
      count+=1
    end
  end
  print '.'
end


runtime = Time.now - started_at

puts "  Finished all in #{sprintf("%.1f seconds", runtime)}" 

puts "Record count: #{count}"



# Strip parens and paren content , whitespace, make lowercase, 