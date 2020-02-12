# frozen_string_literal: true

require_relative '../config/environment'
require_relative 'news'
# This class interact with the user input on slack
class Bot < SlackRubyBot::Bot
  def self.bot_call
    news_command
    intiate_search
  end

  help do
    title 'Ruby News'
    desc 'This bot search for news articles'

    command 'news' do
      desc 'Start a search query'
      long_desc "In case of entring the same search query you will get\n" \
        'A new article until there is no article left.'
    end
  end

  def self.news_command
    command 'news' do |client, data, _match|
      client.say(text: 'What are you searching for?', channel: data.channel)
    end
  end

  # rubocop: disable Metrics/MethodLength, Metrics/AbcSize
  def self.intiate_search
    j = 0
    search_field = ''
    match(/^(?<search>\b((?!=|\,|\.).)+(.)\b)$/) do |client, data, match|
      # reset the counter in case we search for something else
      j = 0 if search_field != data.text
      i = Search.search_results(data.text).to_i - j
      if i.zero?
        client.say(channel: data.channel, text: 'No Article Found')
      else
        search_field = data.text
        # rubocop: disable Layout/LineLength
        client.say(channel: data.channel,
                   text: "Articles about #{match[:search]} \n#{Search.return_results(search_field, j)}")
        client.say(channel: data.channel,
                   text: 'I hope I was helpful to you master!!...Tell me what else to search for?')
        # rubocop: enable Layout/LineLength
        j += 1
      end
    end
  end
  # rubocop: enable Metrics/MethodLength, Metrics/AbcSize

  private_class_method :news_command, :intiate_search
end
Bot.bot_call
