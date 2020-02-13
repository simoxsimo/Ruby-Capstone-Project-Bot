# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'
require_relative 'http_requests'
# This class uses HttpR methods to search for news articles
class Search < HttpR
  def self.search_results(search)
    JSON.pretty_generate(JSON.parse(search(search).body)['totalResults'])
  end
  # rubocop: disable Layout/LineLength

  def self.return_results(search, ind = 0)
    JSON.pretty_generate(JSON.parse(search(search).body)['articles'][ind]['url'])
  end
  # rubocop: enable Layout/LineLength

  def self.search(search)
    news = HttpR.new('https://newsapi.org/v2/everything?',
                     apiKey: ENV['X-RapidAPI-Key'])
    news.params[:q] = search
    news.response(news.url, news.params)
  end

  private_class_method :search
end
