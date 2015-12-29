xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:atom" => "http://www.w3.org/2005/Atom",  :version => "2.0" do
  xml.channel do
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: root_url(format: :rss)
    xml.title 'Подкаст о Тенерифе'
    xml.link root_url
    xml.pubDate @episodes.first.published_at.to_s(:rfc822)

    @episodes.each do |episode|
      xml.item do
        xml.title episode.header
        xml.description episode.short_text
        xml.link episode_url(episode)
        xml.enclosure url: audio_url(episode.audio.url), type: 'audio/mp3', length: episode.audio.metadata['size']
        xml.pubDate episode.published_at.to_s(:rfc822)
        xml.itunes :image, href: episode.image[:large].url
        xml.tag!('itunes:author')  { xml.text! 'Подкаст о Тенерифе' }
      end
    end
  end
end