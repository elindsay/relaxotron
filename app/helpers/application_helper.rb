module ApplicationHelper
  def title_helper
    ["Placidity",
     [@video.try(:name) ? "Video: #{@video.name}" : nil,
      @sound_clip.try(:name) ? "Audio: #{@sound_clip.name}" : nil].
     compact.join(", ")].
    reject{|e| e.empty?}.join(" - ")
  end

  def in_shopping_cart?(product)
    session[:my_cart] ||= []
    session[:my_cart].include?(product.id.to_s)
  end

end
