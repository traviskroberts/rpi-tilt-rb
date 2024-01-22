class PagesController < ApplicationController
  def index
    @beers = Beer.order(:created_at)
  end
end
