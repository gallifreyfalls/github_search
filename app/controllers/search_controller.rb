# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @objects = {}
    search if params[:q]
  end

  private

  def search
    searcher = SearchService.call(params[:q], params[:page])
    if searcher.success?
      @objects = searcher.results
    else
      flash.now[:alert] = 'Your search request is invalid'
    end
  end
end
