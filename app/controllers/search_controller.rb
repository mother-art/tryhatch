class SearchController < ApplicationController
  def index
    require 'google/apis/customsearch_v1'
    searcher = Google::Apis::CustomsearchV1::CustomSearchAPIService.new
    searcher.key = ENV['API_KEY']
    key_word = params[:key_word]

    if !key_word.nil? && !key_word.gsub(/　/," ").strip.empty?
      results = searcher.list_cses(cx: 'cab92271835c239f4', q: key_word)
      items = results.items
      items.nil? ? return : @result = items.map {|item| {title: item.title, link: item.link} }
    end
  end
end