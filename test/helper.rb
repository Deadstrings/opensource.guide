require "minitest/autorun"
require "jekyll"

module Helper
  class << self
    attr_accessor :config, :site
  end
end

def source
  File.expand_path('../', File.dirname(__FILE__))
end

def config
  Helper.config ||= Jekyll.configuration("source" => source)
end

def content
  site.collections['content'].docs.map { |doc| doc.to_liquid }
end

def site
  Helper.site ||= begin
    site = Jekyll::Site.new(config)
    site.reset
    site.read
    site
  end
end
