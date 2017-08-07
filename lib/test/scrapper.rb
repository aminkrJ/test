module Test

  class Scrapper
    attr_accessor :address

    def initialize(address)
      @address = address
    end

    def fetch
      doc = Nokogiri::HTML(open(convert_address_to_params))
      fetch_properties(doc).collect do |prop|
        "#{fetch_address(prop)}, #{fetch_agent_name(prop)}"
      end
    end

    private

    def convert_address_to_params
      words = self.address.split(/\W+/).map(&:downcase)
      "https://www.realestate.com.au/buy/in-#{words[0]},+#{words[1]}+#{words[2]}/list-1"
    end

    def fetch_properties(doc)
      doc.xpath('//article')
    end

    def fetch_address(doc)
      doc.css('.vcard a').children.text
    end

    def fetch_agent_name(doc)
      doc.css('.listerName figcaption').text || doc.css('.listerName').children(1).text
    end
  end
end
