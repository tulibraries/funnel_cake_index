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

Ingest a file

    $ exe/funnel_cake_index ingest /path/to/data.xml 

or ingest a URL

    $ exe/funnel_cake_index ingest http://CombineHarvester.url/combine/oai?verb=ListRecords&set=test_publish_1
