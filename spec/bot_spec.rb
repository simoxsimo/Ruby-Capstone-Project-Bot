# frozen_string_literal: true

require '../lib/http_requests'
require '../lib/news'

RSpec.describe HttpR do
  describe '#query' do
    it 'Generate URL-encoded form data from given Enumerable object' do
      url = URI('https://www.rubydoc.info/gems/http/0.4.0/URI.encode_www_form')
      params = { q: 'ruby', lang: 'en' }
      expect(HttpR.query(url, params)).to eql(url.query)
    end
  end
  describe '#response' do
    it 'Sends a GET request and returns an Net::HTTPResponse object' do
      params = { q: 'ruby', lang: 'en' }
      var = HttpR.new('https://www.rubydoc.info/gems/http/0.4.0/URI.encode_www_form',
                      params)
      expect(var.response(var.url, var.params).class).to eql(Net::HTTPOK)
    end
  end
end

RSpec.describe Search do
  describe '#search' do
    it 'Generate Net::HTTPResponse object for the given argument' do
      expect(Search.search('food').class).to eql(Net::HTTPUnauthorized)
    end
  end
end
