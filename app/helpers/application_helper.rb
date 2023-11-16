module ApplicationHelper
  include Pagy::Frontend
  def generate_options(attribute)
    values = Videogame.pluck(attribute).uniq.map!(&:to_s).sort.compact.select {|el| not ["", "0", nil].include?(el)}
    options_for_select(values.map! { |v| [v.humanize, v] })
  end
end