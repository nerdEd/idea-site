# Idea Site

## What am I?

A site for promoting an event and collecting ideas for that event.

## Getting Started

1. `bundle install`
2. Run `cp config/database.yml.example config/database.yml` and modify as needed. Then run
`rake db:create` and `rake db:schema:load` to get your database ready.
3. Run `cp .env.example .env` and modify as needed.
4. Run `rake secret` and copy the generated value into `secret_token.rb`.
5. `foreman start web` and get developing!

### Clean Up

There are also some remnants of the site this came from laying around in `PagesController` and its views, as well as the assets folder. For now, this has been left around as a suggestion of structure, but you should feel free to delete these if you don't want them.

## "Themeing"

It's nothing fancy yet, but you can change some colors in `app/assets/stylesheets/globals.css.scss`.


## Tests

I don't have any tests. Deal with it.
