# frozen_string_literal: true

# configuration_file.rb
# Note that "#" is a comment, cause it's just ruby

$LOAD_PATH.unshift "./config"
$LOAD_PATH.unshift "./lib"
require "yaml"
require "funnel_cake_index"

solr_config = YAML.load_file("config/blacklight.yml")[(ENV["RAILS_ENV"] || "development")]
solr_url = ERB.new(solr_config["url"]).result

require "traject/macros/nokogiri_macros"
extend Traject::Macros::NokogiriMacros

settings do
  provide "solr.version", "8.0.0"
  provide "solr_writer.max_skipped", -1
  provide "solr_writer.commit_timeout", (20 * 60)
  provide "solr.url", solr_url
  provide "solr_writer.commit_on_close", "true"

  provide "nokogiri.namespaces",
          "oai" => "http://www.openarchives.org/OAI/2.0/",
          "dc" => "http://purl.org/dc/elements/1.1/",
          "dcterms" => "http://purl.org/dc/terms/",
          "oai_dc" => "http://www.openarchives.org/OAI/2.0/oai_dc/",
          "edm" => "http://www.europeana.eu/schemas/edm/",
          "dpla" => "http://dp.la/about/map/",
          "schema" => "http://schema.org",
          "oai_qdc" => "http://worldcat.org/xmlschemas/qdc-1.0/",
          "svcs" => "http://rdfs.org/sioc/services",
          "padig" => "http://padigital.org/ns"

  provide "nokogiri.each_record_xpath", "//oai:record"
  provide "nokogiri.strict_mode", "false"

  if ENV["SOLR_AUTH_USER"] && ENV["SOLR_AUTH_PASSWORD"]
    provide "solr_writer.basic_auth_user", ENV["SOLR_AUTH_USER"]
    provide "solr_writer.basic_auth_password", ENV["SOLR_AUTH_PASSWORD"]
  end
end

# Map origional document.
# We name the field this for consistency with oai_index gem.
to_field "payload_ss", &-> (r, acc) { acc << r.root.to_xml }

# DPLA MAP
to_field "id", extract_xpath("//dcterms:identifier"), first_only
to_field "alternativeTitle_ssim", extract_xpath("//dcterms:alternative")
to_field "collection_ssim", extract_xpath("//dcterms:isPartOf")
to_field "contributor_ssim", extract_xpath("//dcterms:contributor")
to_field "creator_ssim", extract_xpath("//dcterms:creator")
to_field "creator_tsim", extract_xpath("//dcterms:creator")
to_field "date_ssim", extract_xpath("//dcterms:date")
to_field "description_tsim", extract_xpath("//dcterms:description")
to_field "extent_ssim", extract_xpath("//dcterms:extent")
to_field "format_ssim", extract_xpath("//dcterms:format")
to_field "language_ssim", extract_xpath("//dcterms:language")
to_field "spatial_ssim", extract_xpath("//dcterms:spatial")
to_field "publisher_ssim", extract_xpath("//dcterms:publisher")
to_field "relation_ssim", extract_xpath("//dcterms:relation")
to_field "replacedBy_ssim", extract_xpath("//dcterms:isReplacedBy")
to_field "replaces_ssim", extract_xpath("//dcterms:replaces")

to_field "rightsHolder_ssim", extract_xpath("//dcterms:rightsholder")
to_field "source_ssim", extract_xpath("//dcterms:source")
to_field "subject_ssim", extract_xpath("//dcterms:subject")
to_field "subject_tsim", extract_xpath("//dcterms:subject")
to_field "genre_ssim", extract_xpath("//edm:hasType")
to_field "temporalCoverage_ssim", extract_xpath("//dcterms:temporal")
to_field "title_tsim", extract_xpath("//dcterms:title")
to_field "title_ssim", extract_xpath("//dcterms:title")
to_field "type_ssim", extract_xpath("//dcterms:type")

# edm:WebResources

to_field "fileFormat_ssim", extract_xpath("//schema:fileFormat")
to_field "rights_ssim", extract_xpath("//dcterms:rights")
to_field "rights_tsim", extract_xpath("//dcterms:rights")
to_field "rightsUri_ssim", extract_xpath("//edm:rights")
to_field "rightsUri_tsim", extract_xpath("//edm:rights")
to_field "iiifManifest_ssim", extract_xpath("//dcterms:isReferencedBy")
to_field "iiifBaseUrl_ssim", extract_xpath("//svcs:hasService")

# ore:Aggregation

to_field "contributingInstitution_ssim", extract_xpath("//edm:dataProvider")
to_field "contributingInstitution_tsim", extract_xpath("//edm:dataProvider")
to_field "url_ssim", extract_xpath("//edm:isShownAt")
to_field "intermediateProvider_ssim", extract_xpath("//dpla:intermediateProvider")
to_field "preview_ssim", extract_xpath("//edm:preview")
to_field "provider_ssim", extract_xpath("//edm:provider")
to_field "mediaMaster_ssim", extract_xpath("//padig:mediaMaster")

# Case insensitive ID search

to_field "id_tsim", extract_xpath("//dcterms:identifier")
