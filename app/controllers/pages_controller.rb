class PagesController < ApplicationController
  before_action :require_user

  def index
    @beers = Beer.order(:created_at)
  end
end
