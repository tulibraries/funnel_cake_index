# Funnel Cake Indexer

Index data collected from Combine into Solr.

## Installation

Add this line to your application's Gemfile:

    gem "funnel_cake_index", github: "tulibraries/funnel_cake_index"

To test with a development branch, add the branch name

    gem "funnel_cake_index", github: "tulibraries/funnel_cake_index", branch "GIT_BRANCH_NAME"

And then install the bundle:

    $ bundle instsall

Or install it yourself as:

    $ gem install funnel_cake_index

## Usage

Ingest a file

    $ bundle_exec funnel_cake_index ingest /path/to/data.xml 

or ingest a URL

    $ bundle_exec funnel_cake_index ingest http://CombineHarvester.url/combine/oai?verb=ListRecords&set=test_publish_1
