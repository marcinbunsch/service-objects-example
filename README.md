# Service Objects Example app

This is a sample application which houses a working example of code featured in the [Wrangling Service Objects with method_struct](http://www.bunsch.pl/2014/10/14/wrangling-service-objects-with-method_struct/) blog post.

It's a Rails 4.1.6 app with SQLite3. To get it running, do the following:

```bash
git clone git@github.com:marcinbunsch/service-objects-example.git
cd service-objects-example/
bundle
bin/rake db:migrate
bundle exec rspec spec
```

## License

It's a sample. You are free to do whatever you want to this code.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

