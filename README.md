Capital-Oneder
-----------
Introduction
----
I chose to build this app in Ruby and Sinatra Framework. I also used PostgreSQL for storage and used a Ruby gem called `pg` to interact with it within my code.

The tech-test specifications hadn't indicated which stack to use for this build. I completed this task with the stack that had most recent exposure to. I did this so I could complete the task and demonstrate my understanding of the full-stack.

The website can be accessed through local-host and you have the option to either interact with it using the UI or API GET and PUT requests via `curl` or `POSTMAN`. Further documentation below.

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

GET/POST requests via curl or Postman
-----
In this section I have provided instruction for making a post requests via `curl`.
I have also provided links for `curl` and `POSTMAN` installation and use.

[curl installation](https://curl.haxx.se/download.html) / [POSTMAN](https://www.getpostman.com/)

After installation, to interact with with the website API using `curl` copy and paste the following
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

GET request:
```
curl -i -H "Accept: application/json" -H "Content-Type: application/json"
-X GET http://localhost:9292/api/v1/citizens
```
