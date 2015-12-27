class EpisodesController < ApplicationController
  def index
    @episodes = Episode.published.published_order.to_a
    @current = @episodes.first.decorate
    @previous = @episodes[1..-1].map(&:decorate)
  end

  def show
    @episode = Episode.find_by(slug: params[:id])
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def episode_params
    params.
      require(:episode).
      permit(:slug, :header, :text, :published_at, :audio, :image)
  end
end
