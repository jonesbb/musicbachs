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
    
    #pull the text from the search box
    artist_search_text = params['myform']['artistext']
    @a_srch_txt = artist_search_text
    #add some check for artist_search_text to be non-empty
    if artist_search_text.blank?
      @no_search = "empty search"
    else
      # Call the metaspotify wrapper
      # :query, :items_per_page, :start_index, :total_results
      results = MetaSpotify::Artist.search(artist_search_text)  
  
      items_per_page = results[:items_per_page]
      starting_item  = results[:start_index]
      
      #Find out how many pages of results there are
      quantity = results[:total_results]
      pages = (quantity.to_f/items_per_page).ceil
      
      @fr = results.keys
      @qua = quantity    
      artist_results = results[:artists]   # :name, :popularity, :uri
  
      @a_var = artist_results
  
      ###
      #if temp2.is_a?(Array)
       # @vari = temp2.length
      #end
    end
  end

end
