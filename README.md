<h1 align="center">[Ruby] Capstone Project / Slack Bot</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT " src="https://img.shields.io/badge/License-MIT -yellow.svg" />
  </a>
  <a href="https://twitter.com/MohammedTouili " target="_blank">
    <img alt="Twitter: MohammedTouili " src="https://img.shields.io/twitter/follow/MohammedTouili.svg?style=social" />
  </a>
</p>

## Description of the project 

>The purpose of this project is to implement a Slack bot that searches for news articles related to the search query

## Built with
<ul>
  <li>Ruby (slack-ruby-bot gem)</li>
</ul>

## Dev Environment Requirement:
Before running the code you need both Slack Api Key ("config/.slackbot") and News Api Key ("config/.news") To get these check the following links:
- [Slack](https://my.slack.com/services/new/bot)
- [News API](https://newsapi.org/account)

## ⭐️ Running the code
Inside The project Repository run the following command:
```
    rake deploy:run
```
## ⭐️ Testing the code with RSpec
Inside The spec directory run the following command:
```
> rspec game_spec.rb
```
## ⭐️ Bot Instructions
1. Choose/Create a channel on slack

2. Invite the bot using the slash command "/invite @botname"

3. "@botname help" for further instructions

   ### bot Test
   

   ![instructions](img/test.gif)

## Author

👤 **Mohammed TOUILI**
 
* Github: [@simoxsimo](https://github.com/https:\/\/github.com\/simoxsimo)
