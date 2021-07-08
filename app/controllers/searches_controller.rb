class SearchesController < ApplicationController
    def searches
    @range = params[:range]
    @search = params[:search]
    @word = params[:word]

if @range == 'user'
    @users = User.search(@search,@word)
else
    @books = Book.search(@search,@word)
end

    end
end
        