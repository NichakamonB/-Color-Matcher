class HomeController < ApplicationController
  def index
    @colors = Color.all.order(:id)
  end
end
