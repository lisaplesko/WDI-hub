# Web Development Immersive on Github

Discover the students of WDI at General Assembly Boston.  Take a peek at past & current cohorts; keep track of code being pushed.

(App originally developed to showcase different cities; updated in January 2015 to only show Boston cohorts)

## Features
* Index site shows a collection of faces from General Assembly's Boston Web Development Immersive Program
* Hover over avatars to see names
* Filter by cohort
* Search by name
* Select a student to see their Github activity, including:
    Total # of repos
    Followers & following count
    Top 3 starred repositories
    Most recent 5 commits (updates daily)
    Breakdown of languages pushed in total to Github

## Project Description
This project was created to meet requirements for the Final Project in General Assembly's Web Development Immersive Program (July 2014).

Intended to test our ability to use a number of different skills acquired throughout the course.

WDI Hub is built on the following:
> * Rails API
> * PostgreSQL
> * Octokit (Github API)
> * AngularJS
> * CSS3 animations
> * Automated Rake Tasks
> * Front- and back-end testing utilizing RSpec and Protractor
> * Unicorn Web Server
> * Angular caching
> * Amazon Cloudfront

This project was brainstormed, scoped and developed in one week.

I look forward to developing this project further and adding new features. Future feature ideas include:
> * Adding websockets to ping when a student pushes code to Github
> * Adding messaging to Github users
> * Displaying cohort stats and real-time data for when students are pushing code

####Wireframes & Schema:
![wireframes and schema](/documents/wireframes_schema.jpg "Development: Wireframes & Schema")

####Implementation:
![implementation](/documents/demo.jpg "Production")

####Known issues to address:
Previous/Next buttons (on student 'show' page) will produce no results when they reach the end of records; intend to make infinite loop. Submitted my first [Stack Overflow](http://stackoverflow.com/questions/24644062/create-a-next-record-previous-record-button-in-angular) question seeking solution for placing logic to handle this.

## Installation

This app requires a Github Access Token from https://developer.github.com/ (note: Github requires developers to register with the GitHub Developer Program).

Create a .env at the root of the github_api directory with the following:

    GITHUB_ACCESS_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

To begin, run `bundle install`

Additional setup for the database and initial API calls:

    rake db:create
    rake db:seed
    rake githubdata:account_info      # Load Github acct information
    rake githubdata:repos             # Load repositories
    rake githubdata:commit_messages   # Load most recent push data

## Testing

This app utilizes both RSpec and Protractor testing.

**RSpec**:  Inside the github_api directory, run `$ rspec`  (Tests are located within the spec/requests directory)

**Protractor**:  Make sure the project is running on a rails server at Port:3000.  Spin up a webdriver-manager in your console with `webdriver-manager start`.  Change into the github_api directory, and in a separate tab, run `protractor public/tests/conf.js`  (Tests are located in public/tests/e2e directory)

## More information
If you are a WDI student and would like to be added to the directory, please submit a pull request with your name and Github username.

Created by [Lisa Plesko](http://www.github.com/lisaplesko).
