class ScrapingsController < ApplicationController
  def index
    @scrapings = Scraping.all
    @youpidd = "test"
  end

  def refresh
    #@user = @user + 1

    respond_to do |format|
      format.html
      format.js
    end
  end
end
