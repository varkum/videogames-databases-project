module ApplicationHelper
  include Pagy::Frontend
  def generate_options(attribute)
    options_for_select(Videogame.pluck(attribute).uniq.map!(&:to_s).sort.map(&:humanize).compact.select {|el| not ["", "0", nil].include?(el)})
  end
end
