xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:atom" => "http://www.w3.org/2005/Atom",  :version => "2.0" do
  xml.channel do
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: root_url(format: :rss)
    xml.title 'Подкаст о Тенерифе'
    @episodes.each do |episode|
      xml.item do
        xml.title episode.header
        xml.enclosure url: audio_url(episode.audio.url), type: 'audio/mp3'
        xml.pubDate episode.created_at.to_s(:rfc822)
      end
    end
  end
end