require 'nokogiri'
require 'rest-client'


class CrawlingController < ApplicationController

#두부김치
    def image
        @url1 = 'https://t1.daumcdn.net/cfile/tistory/160CC60D49CD1C5D06'
        @page1 = RestClient.get(@url1)
        @doc1 = Nokogiri::HTML(@page1)
        @info1 = @doc1.css('em.main_figure')
    end

    def recip
        @url2 = 'https://terms.naver.com/entry.nhn?docId=1286417&cid=40942&categoryId=32136'
        @page2 = RestClient.get(@url2)
        @doc2 = Nokogiri::HTML(@page2)
        @info2 = @doc2.css('div.size_ct_v2')
        print("infooooo\n")
        print(@info2)
        
        print("doc2\n")
        print(@doc2)
    end
end