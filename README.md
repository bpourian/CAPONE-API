Capital-Oneder [![Build Status](https://travis-ci.org/bpourian/CAPONE-API.svg?branch=master)](https://travis-ci.org/bpourian/CAPONE-API)
=============

Introduction
----
I decided to build this app in Ruby and Sinatra Framework. I used PostgreSQL for storage along with a Ruby gem called `pg` to interact with the database within my code.

I also used a gem called `SimpleCov`, this is a code coverage analysis tool for Ruby. It helped me to ensure high test coverage whilst test driving my development.

The tech-test specifications hadn't indicated which programming language to use for this build. I completed the challenge in a language that I had most recent exposure to. Although, I appreciate that the tech-stack at Capital One is varied, I wanted to demonstrate my technical abilities and discover more about API's.

The website can be accessed through local-host and you have the option to either interact with it using the UI or API GET and PUT requests via `curl` or `POSTMAN`. Further documentation below.

I have also setup Travis CI, to view that the build was successful simply click on the build logo at the top.

See more on my approach <a href='#process'>below</a>.

Heroku
----

I have hosted the application on `Heroku`, why not try it out by visiting:

[capital-oneder.herokuapp.com](https://capital-oneder.herokuapp.com/)

If you want to see the results in a `json` format visit the api link below:


[https://capital-oneder.herokuapp.com/api/v1/citizens](https://capital-oneder.herokuapp.com/api/v1/citizens)



Instructions
-------

Clone this repository in your directory
```
$ git clone https://github.com/bpourian/CAPONE-API.git
```
Change directory
```
$ cd CAPONE-API
```
Run 'bundle' to ensure you have all the libraries
```
$ bundle
```
Create your databases by running the command(assuming you have PostgreSQL installed already)
```
$ rake setup
```
This will create two databases one for test and the other for your dev environment. Once that's done it will also create
the relevant tables with correct data columns. The easiest way to confirm setup is to run RSpec.
```
$ rspec
```
You should see all tests pass-green

To use the app:
```
$ rackup
```
Once your localhost is up and running, visit:

[http://localhost:9292](http://localhost:9292)

N.B. requires ruby version 2.4.1 and the bundler gem.

Interaction
----

The website has the following pages which you can interact with;

Homepage or application page for citizen registration which leads to a
confirmation page, where you will be given your `citizen id`:

[http://localhost:9292](http://localhost:9292)

API link - If you visit this link in your browser you can view all the registered citizens(this new country
  believes in freedom of information!).

[http://localhost:9292/api/v1/citizens](http://localhost:9292/api/v1/citizens)


GET/POST requests via curl or Postman
-----
In this section I have provided instruction for making a post requests via `curl`.
I have also provided links for `curl` and `POSTMAN` installation and use.

[CURL](https://curl.haxx.se/download.html) / [POSTMAN](https://www.getpostman.com/)

After installation, to interact with the website API using `curl` copy and paste the following
in your command line:

N.B. Ensure you are running your local-host - `rackup`

POST request(Single name upload):
```
curl -i -X POST -H "Content-Type: application/json" -d'{"salutation":"Mr",
"first_name":"Joe","last_name":"Blogs","previous_country":"UK",
"gender":"Male"}' http://localhost:9292/api/v1/citizens
```

Once you have pressed enter you should receive the following message;
```
$ {"status":"200","message":"Citizen Updated"}
```

POST request(Multiple names upload):

You can play around and insert any name you'd like and if you did want to load more than
one name at the same time simply follow this data structure and add to it:
```
[{"salutation":"Mr",
"first_name":"Joe","last_name":"Blogs","previous_country":"UK",
"gender":"Male"}, {"salutation":"Mrs",
"first_name":"Jane","last_name":"Blogs","previous_country":"UK",
"gender":"Female"}]
```
To test this lets do another POST request and check our databse:
```
curl -i -X POST -H "Content-Type: application/json" -d'[{"salutation":"Mr",
"first_name":"Joe","last_name":"Blogs","previous_country":"UK",
"gender":"Male"}, {"salutation":"Mrs",
"first_name":"Jane","last_name":"Blogs","previous_country":"UK",
"gender":"Female"}]' http://localhost:9292/api/v1/citizens

```

Don't forget you can interact with the live version by simply swapping the url with:

```
https://capital-oneder.herokuapp.com/api/v1/citizens
```

If you want access to the whole database in the form of json you can do that too
by either visiting the following link 'http://localhost:9292/api/v1/citizens' or
using the following `curl` command in terminal:

GET request:
```
curl -i -H "Accept: application/json" -H "Content-Type: application/json"
-X GET http://localhost:9292/api/v1/citizens
```
User Stories
---------
```
----------MVP V1----------

As a User
So that I can register as a citizen of Capital-Onder
I would like to visit a webpage

As a User
So that I can give my information over on the website
I would like to complete a form
```
```
----------MVP V2----------
As a User
So that I can be sure that I am registered
I would like to receive a citizenship id number
```
```
----------MVP V3----------
As a User
So that I can view the applicants at a later time
I would like to be able to store their details
```

```
----------MVP V4----------
As a User
So that I can register multiple applicants
I would like to be able to register them in one go
```

Process
------
Initially when I read the specs for this task there was an element of confusion as to what exactly I had to build. The requirements were not specific and I wasn't able to find out more information. So, I set about researching online and trying to understand what is really meant by an `API`. I reached a conclusion that without additional information I will not be able to determine for certain what type of an `API` was required. In my research I came across this interesting [article](https://www.upwork.com/hiring/development/intro-to-apis-what-is-an-api/), which helped me to take a more decisive action in my design.

So, I set about writing user stories, diagramming and jotting down ideas. I finally decided that I was going to build a webapp with its own API so that if requirements did change and there was a need for a more specific application I would have an `API` to interact with. This was the first time I had attempted to build something like this and I really welcomed the challenge. In my attempt to complete this challenge, I read several blogs and looked at a number of repositories as well as previous applications I had made.

• I test drove my production and ensured that I kept an eye on the code analysis to ensure high test coverage.

• I setup my environment and ensured I was making regular git/github commits with clear notes

• I setup a rake file to help with database setup and cleaning after each test

• PostgreSQL is what I used for local storage along with an app called PSequel to manually validate the input data on top of existing tests

Improvements
----
Given more time I would like to have completed the following;

• Ensured my API was tested with the aid of a gem called [VCR](https://github.com/vcr/vcr) to record my API calls

• Use of Flash in Sinatra to display database errors when inserting a duplicate name or other invalid data type


Test Specifications
------
In the establishment of the New World Order, CapitalOne has laid down plans for creating a
nation, Capital Oneder, for anyone to be a part of. To become a citizen, people need to send in
the following info:

• Salutation (Mr, Mrs, Miss or Ms)

• Name

• Previous country

• Sex

When a person becomes a citizen, they are provided with a Capital Onederer unique
identification tag.

Requirements:

The president of Capital Onederer, Rich Faircountry, expects 100MM people apply for
citizenship on the first day. We need an API to register the customers as they come in, without
missing anyone out, hopefully. Every citizen should also receive the initial details needed to
make them a citizen.

At a later point, it might be needed for the head of a family to be able to add in all the members
of their family in one go.
