# SHOUTER: THE FINAL BOSS

# Trumpets are playing, a choir is singing, and a really handsome TV presenter is introducing all you to… THE BIG EXERCISE!

# But don’t be scared. It’s just a bigger exercise than normal, using all the useful stuff we learned this week: testing with RSpec, the
# TDD methodology, Sinatra, ERB and ActiveRecord. Quite a lot for being just the second week!

# Let’s go back to 2006. Jack Dorsey, then an undergraduate student at New York University, had introduced a first draft of Twitter (then
#twtr) to a bunch of guys from Odeo, and ended up implementing it as an internal service for that company. Later on, in the summer, Twitter
#was released to the public. The rest is history, and by the way Mr Dorsey founded another company called Square (squareup.com).

# Do you know how he implemented Twitter, though? YEAH. AHA. With Ruby on Rails.

# So now we will put ourselves the “I am Jack Dorsey” hat, and will use Sinatra to implement a first version of our desired web application.
#We will call it… SHOUTER, because we are THIS cool.

# The rest will be pretty much an early version of Twitter.
# - The Model(s)
#   - We will have two models, User and Shout.
#   - The User model will have:
#     - A name, which must be present.
#     - A handle, which must be present and unique. It should not contain spaces, and be only characters in downcase.
#     - A password, which must be present and will be generated randomly when creating a User. It will be 20 characters long and unique.
#   - The Shout model will have:
#     - A message, with at least one character and at most 200. (BECAUSE SHOUTING NEEDS MORE CHARACTERS THAN TWITTING)
#     - A many-to-one relation to a User, which must be present.
#     - A created_at, which is the moment when the SHOUT is saved (this behaviour must be implemented within the class, not outside). It
#     must be present.
#     - A likes counter, which must be an integer, at least 0.
# - The website
#   - We will have a main page where we can SHOUT. There will be a form in the top that takes care of that with a wide text field for the
#   message, and an input button in order to SHOUT.
#   - In order to authenticate ourselves for SHOUTING, we will just add an input field for the password. This will identify ourselves!
#   - The main page will also have a list of SHOUTS, sorted newest first, rendering the name, the handle for the user, and the message
#   itself.
#   - Plus, every SHOUT will show the number of likes, and have a “Like” button that will increase the number of likes for a SHOUT; after
#   clicking the button we will be redirected to the main page again.
#   - We are going to use the likes from each SHOUT to add a new route, called (‘/best’), which will show the SHOUTS sorted by the number
#   of likes.
#   - Similarly, we are going to have a route called ‘/:handle’ which basically shows all the SHOUTS from the user attached to that
#   specific handle.

# In order to make development easier, create some users using PRY, because we won’t have any UI to create users via the website.

# Note: you will find a skeleton .rb file and an empty SQLite database for all this in Slack!
