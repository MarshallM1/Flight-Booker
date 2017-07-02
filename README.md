# Flight Booker

A small flight booking app, designed to showcase advanced forms.

See the app live at https://bloc-mountie-21671.herokuapp.com/

See [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-advanced-forms) for the project spec.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

And seed the database (optional, for prepopulating with flights and airports):

```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## TO-DO:

* Rework test-suite