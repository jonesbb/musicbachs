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
    
    artist_search_text = params['myform']['artistext']
    #do your stuff with comments_from_form here
    
    results = MetaSpotify::Artist.search(artist_search_text)

    items_per_page = results[:items_per_page]
    starting_item  = results[:start_index]
    
    #Find out how many pages of results there are
    quantity = results[:total_results]
    pages = (quantity.to_f/items_per_page).ceil
    
    @fr = results.keys
    @qua = quantity
    @temp = results[:artists].each{|i| puts i.name}

  end

end
