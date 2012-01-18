class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def search
    @title = "Search"
  end

  def search_artists
    artist_search_text = params['myform']['artistext']
    #do your stuff with comments_from_form here
  end
end
