class AudioUploader < Shrine
  plugin :activerecord
  plugin :pretty_location
  plugin :logging

  def generate_location(io, context)
    "audios/#{context[:record].slug}.mp3"
  end
end
