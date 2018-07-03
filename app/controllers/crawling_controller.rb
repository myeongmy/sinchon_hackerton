require 'nokogiri'
require 'rest-client'


class CrawlingController < ApplicationController
    
def crawl
#       #1.두부김치
#       @url = 'https://terms.naver.com/entry.nhn?docId=1286417&cid=40942&categoryId=32136'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('div.size_ct_v2 > p')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #2.치즈스틱
#       @url = 'https://terms.naver.com/entry.nhn?docId=1524877&cid=48169&categoryId=48223'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('p.txt')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #3.돼지갈비구이
#       @url = 'https://terms.naver.com/entry.nhn?docId=1084776&cid=40942&categoryId=32136'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('p.txt')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #4.계란말이
#       @url = 'https://terms.naver.com/entry.nhn?docId=3543696&cid=40942&categoryId=32136'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('p.txt')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #5.타코야키
#       @url = 'https://terms.naver.com/entry.nhn?docId=1225586&cid=40942&categoryId=32129'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('p.txt')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #6.제육볶음
#       @url = 'https://terms.naver.com/entry.nhn?docId=1286421&cid=40942&categoryId=32136'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('p.txt')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #7.떡볶이
#       @url = 'https://terms.naver.com/entry.nhn?docId=1086421&cid=40942&categoryId=32136'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('div.size_ct_v2 > p')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
      
#       #8.돼지곱창구이
#       @url = 'https://terms.naver.com/entry.nhn?docId=1988140&cid=48164&categoryId=48202'
#       @page = RestClient.get(@url)
#       @doc = Nokogiri::HTML(@page)
#       @info = @doc.css('div.size_ct_v2 > p')
      
#       c = Content.new
#       c.content = @info.text
#       c.save
    
#     redirect_to :root
end
end