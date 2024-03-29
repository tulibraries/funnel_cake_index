# Funnel Cake Indexer

Index PA Digital metadata into a Solr collection. This is designed to be used with the [Funnel Cake Blacklight application](https://github.com/tulibraries/funnel_cake).

See also the [related Solr configuration files](https://github.com/tulibraries/funnel_cake_index).

## Installation

Add this line to your application's Gemfile:

    gem "funnel_cake_index", github: "tulibraries/funnel_cake_index"

To test with a development branch, add the branch name

    gem "funnel_cake_index", github: "tulibraries/funnel_cake_index", branch "GIT_BRANCH_NAME"


And then install the bundle:

    bundle install

Or install it yourself as:

    gem install funnel_cake_index

## Usage

Ingest a file into SOLR_URL

    funnel_cake_index ingest /path/to/data.xml

or ingest a URL

    funnel_cake_index ingest http://CombineHarvester.url/combine/oai?verb=ListRecords&set=test_publish_1

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tulibraries/funnel_cake_index. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CobIndex project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tulibraries/funnel_cake_index/blob/main/CODE_OF_CONDUCT.md).
