require 'nokogiri'
require 'rest_client'

module Parse
    
    class Movie
            
    end
    
    class Animal
        def self.cat # 인스턴스화 시키지 않고 바로 불러오기 위해 self.을 함
            @url = "http://thecatapi.com/api/images/get?format=xml&type=jpg"
            @cat_xml = RestClient.get(@url)
            @cat_doc = Nokogiri::XML(@cat_xml)
            @cat_url = @cat_doc.xpath("//url").text
        end
    end
end