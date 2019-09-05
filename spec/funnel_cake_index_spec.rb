# frozen_string_literal: true

RSpec.describe FunnelCakeIndex do
  let(:indexer) do
    indexer = Traject::Indexer::NokogiriIndexer.new
    indexer.load_config_file(File.join(File.dirname(__FILE__), "..", "lib", "funnel_cake_index", "indexer_config.rb"))
    indexer
  end

  let(:mapped_record) { indexer.map_record(record) }

  it "has a version number" do
    expect(FunnelCakeIndex::VERSION).not_to be nil
  end

  context "An Image Record is provided" do
    # keys MUST be strings or an error is thrown.
    let(:record) do
      File.open(File.join(File.dirname(__FILE__), "fixtures", "record.xml")) { |f| Nokogiri::XML f }
    end

    it "parses out the title" do
      expect(mapped_record["title_tsim"]).to eq(["Baseball team"])
    end

    it "parses out the type" do
      expect(mapped_record["type_ssim"]).to eq(["Image"])
    end

    it "parses out the subjects" do
      expect(mapped_record["subject_ssim"]).to eq(["Baseball players", "Baseball", "Athletes", "Sports"])
    end
  end
end
