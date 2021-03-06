class EpisodeDecorator < Draper::Decorator
  delegate_all

  def published_date
    l(object.published_at.to_date, format: :long)
  end

  def text
    to_html(object.text)
  end

  def short_text
    text = object.text.split("\n").first
    to_html(text)
  end

  private

  def to_html(text)
    string = Kramdown::Document.new(text).to_html
    string = Sanitize.fragment(string, elements: %w(b p br h2 h3 h4 ul li))
    string.html_safe
  end
end
