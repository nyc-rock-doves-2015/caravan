# Review Notes

## /vendor and Asset Location

I see a number of vendor JS assets that belong here instead of
`vendor/assets/javascripts`.  Basically, if you didn't write it, it should go
in `/vendor`.  For example:

  * jquery.easing.min.js*
  * underscore-min.js

## specs

### controller

Seem to have some anti-patterns, non-sensical, sloppy work hiding in here

e.g. in `parcels_controller`

You declare in a `before(:each)` to mock the current user (good!) but then you
re-mock it in the `it` blocks e.g. 11, 23, etc.

It's **massively** sloppy to use the test of a `Model.create` to use
`Model.last` as the measure of success.  RSpec has the ability to do work
inside of a block and to use the end result of that block as a measure of
successful change.  e.g.

    expect {
      # work in this block
    }.to change(Model, :count)

There's also many opportunities for DRYness e.g.

      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id: user.id)

There's also some grossness in how you're naming the tests, your first test is:
`GET #show`, but your action is a `POST`.  That's entirely nonsensical.  I've
cleaned up `parcels_controller_spec` to show you how `it` tests can be DRY,
clear, and focused.  No doubt further work is possible.

**Your controller specs need some refactoring.  Block that time in now**

## Models

Something happens when I create a new parcel. There's something that's trying
to talk to Google.  We should not be doing this in our testing universe.

Further, there is something very not right in your model set-up (I think in the
`Address` model) is that I can't simply factory an `Address`.

    ➜  caravan git:(master) ✗ be rails c -se=test
    Loading =test environment in sandbox (Rails 4.2.1)
    Any modifications you make will be rolled back on exit
    irb(main):001:0> FactoryGirl.create(:address, user: User.last)
      User Load (0.6ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" DESC LIMIT 1
       (0.1ms)  SAVEPOINT active_record_1
    Geocoding API connection cannot be established.
      SQL (0.9ms)  INSERT INTO "addresses" ("id", "user_id", "city", "state", "zip_code") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["id", 1], ["user_id", 31], ["city", "Portland"], ["state", "OR"], ["zip_code", "96519-8936"]]
    PG::UniqueViolation: ERROR:  duplicate key value violates unique constraint "addresses_pkey"
    DETAIL:  Key (id)=(1) already exists.
    : INSERT INTO "addresses" ("id", "user_id", "city", "state", "zip_code") VALUES ($1, $2, $3, $4, $5) RETURNING "id"
       (0.2ms)  ROLLBACK TO SAVEPOINT active_record_1
    ActiveRecord::RecordNotUnique: PG::UniqueViolation: ERROR:  duplicate key value violates unique constraint "addresses_pkey"
    DETAIL:  Key (id)=(1) already exists.
    : INSERT INTO "addresses" ("id", "user_id", "city", "state", "zip_code") VALUES ($1, $2, $3, $4, $5) RETURNING "id"
            from /Users/sgharms/.gem/ruby/2.1.2/gems/activerecord-4.2.1/lib/active_record/connection_adapters/postgresql_adapter.rb:602:in `exec_prepared'
 

Ugh, you really need to re-think how your model works here.


## Controllers

### Weird iVar

What's going on with this `@method` thing?  I've never seen that before.
Why not keep the form_tag part variant based on the view (i.e. edit, update)
and then have the _body_ of the form in the shared partial?

This isn't how you really want to be using instance variables.

Also, you could hide the iVar setting button text inside the view.

### Cleanup

But why did you commit a `node_modules` dir?

EVERY commit should have its proposed `diff` looked at _carefully_.

Event sourcing model:  every entity is a series of events; command-query
separation pattern  What does my query look like is the manifested result of
the event queries.

## Routes

You have a **ton** of routes for a 1-week project.  I think you're doing big
design up front and getting away from agility.  63 routes?

## Models

* `Address` model needs work, those methods are beasty!
* And you need some testing around anything of this level of complexity.
* Trip is as bad as `Address`
* `all_matching_parcel` really hurts my eyes.  Can we create a class to hold
  this logic?

## .each

I want you to look at every use of `.each` and decide if there is a better
enumerable to help you.  Most of the time you'd be better with:

* better SQL
* `map`
* `reduce`
* `inject`

## Views

* Are very complex
* Tend to have a lot of logic in them that belongs in the controller
* Are not using Rails' view helpers
* HTML: You're not writing well structred HTML in places e.g. _signin,
    e.g. there are no labels, you're missing some structural elements

##  Cruft

"Original Layout.html": rm?

