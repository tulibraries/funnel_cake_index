# frozen_string_literal: true

require "funnel_cake_index/version"
require "open-uri"
require "traject"

module FunnelCakeIndex
  module CLI
    #class Error < StandardError; end
    def self.ingest
      indexer = Traject::Indexer::NokogiriIndexer.new("solr_writer.commit_on_close": true)
      indexer.load_config_file(File.join(File.dirname(__FILE__), "funnel_cake_index", "indexer_config.rb"))
      open(ARGV[0]) do |f|
        indexer.process(f.read)
      end
    end
  end
end
