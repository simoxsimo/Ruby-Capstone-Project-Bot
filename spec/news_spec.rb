# frozen_string_literal: true

require_relative '../lib/news'

RSpec.describe Search do
  ENV['X-RapidAPI-Key'] = '94cdf148f92a4ebaa5b9e83cbba92f3a'
  describe '#search' do
    it 'Generate Net::HTTPResponse object for the given argument' do
      expect(Search.send(:search, 'food').class).to eql(Net::HTTPOK)
    end
  end
  describe '#search_results' do
    it 'Return number of results found' do
      expect(Search.search_results('food')).to eql('68104')
    end
  end
  describe '#return_results' do
    it 'Return the link of the article' do
      # rubocop: disable Layout/LineLength
      expect(Search.return_results('food', 0)).to eql('"https://lifehacker.com/how-to-reduce-your-food-delivery-and-takeout-waste-1841575332"')
      # rubocop: enable Layout/LineLength
    end
  end
end
