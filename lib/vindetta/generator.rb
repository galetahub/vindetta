require "net/http"

module Vindetta
  class Generator
    def self.generate(options = {})
      Net::HTTP.get("randomvin.com", "/getvin.php")
    end
  end
end
