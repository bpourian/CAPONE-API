Capital-Oneder
-----------
Introduction
----
I chose to build this app in Ruby and Sinatra Framework. I also used PostgreSQL for storage and used a Ruby gem called `pg` to interact with it within my code.

The tech-test specifications hadn't indicated which stack to use for this build. I completed this task in the stack that had most recent exposure to. I did this so I could complete the task and demonstrate my understanding of the full-stack.

The website can be accessed through local-host and you have the option to either interact with it using the UI or API GET and PUT requests via `curl` or `POSTMAN`. Further documentation below.

I have also hosted the application on `HEROKU`, however I ran out of time whilst attempting to set-up the database.
[capital-oneder.herokuapp.com](https://capital-oneder.herokuapp.com/)

See more on my approach <a href='#process'>below</a>.

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

API link - If you visit this in your browser you can view all the registered citizens(this new country
  believes in freedom of information!).
http://localhost:9292/api/v1/citizens](http://localhost:9292/api/v1/citizens)


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
If you want access to the whole database in the form of json you can do that too
by either visiting the following link 'http://localhost:9292/api/v1/citizens' or
using the following `curl` command in terminal:

GET request:
```
curl -i -H "Accept: application/json" -H "Content-Type: application/json"
-X GET http://localhost:9292/api/v1/citizens
```
Specifications
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

## Requirements
----
The president of Capital Onederer, Rich Faircountry, expects 100MM people apply for
citizenship on the first day. We need an API to register the customers as they come in, without
missing anyone out, hopefully. Every citizen should also receive the initial details needed to
make them a citizen.

At a later point, it might be needed for the head of a family to be able to add in all the members
of their family in one go.
