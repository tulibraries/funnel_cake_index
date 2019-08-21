# frozen_string_literal: true

require "funnel_cake_index/version"
require "traject"

module FunnelCakeIndex
  module CLI
    #class Error < StandardError; end
    def self.ingest
      indexer = Traject::Indexer::NokogiriIndexer.new("solr_writer.commit_on_close": true)
      indexer.load_config_file(File.join(File.dirname(__FILE__), "funnel_cake_index", "indexer_config.rb"))
      File.open(ARGV[0]) do |file|
        indexer.process(file)
      end
    end
  end
end
