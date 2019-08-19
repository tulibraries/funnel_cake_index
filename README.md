# Funnel Cake Indexer

Index data collected from Combine into Solr.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'funnel_cake_index'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install funnel_cake_index

## Usage

Download the combine xml data with wget, and rename it to something more readable.

    $ wget --output-document=combine_data.xml http://CombineHarvester.url/combine/oai?verb=ListRecords&set=test_publish_1

Under the hood, that command uses [traject](https://github.com/traject/traject), with hard coded defaults. If you need to override a default to ingest your data, You can call traject directly:

    $ bundle exec traject -i xml -c lib/traject/combine_indexer.rb combine_data.xml
