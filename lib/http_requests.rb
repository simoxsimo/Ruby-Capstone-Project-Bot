# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'
# This class uses http protocol to auth and get response fron Api
class HttpR
  attr_accessor :url, :params
  def initialize(url, params)
    self.url = URI(url)
    self.params = params
  end

  def response(url, params)
    HttpR.query(url, params)
    Net::HTTP.get_response(url)
  end

  def self.query(url, params)
    url.query = URI.encode_www_form(params)
  end
end
