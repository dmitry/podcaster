require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :versions, names: [:large, :medium, :small]
  plugin :store_dimensions
  plugin :activerecord
  plugin :pretty_location
  plugin :logging

  def process(io, context)
    if context[:phase] == :store
      size_700 = resize_to_limit(io.download, 700, 700)
      size_500 = resize_to_limit(size_700,    500, 500)
      size_300 = resize_to_limit(size_500,    300, 300)

      {large: size_700, medium: size_500, small: size_300}
    end
  end

  def generate_location(io, context)
    "images/#{context[:record].slug}.png"
  end
end
