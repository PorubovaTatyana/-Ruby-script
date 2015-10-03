# coding: utf-8
require 'rubygems' 
require 'nokogiri'
require 'open-uri'

puts 'Ruby-скрипт для выделения текстов из статей'
print 'Введите ваш запрос (Вместо пробела используйте нижнее подчеркивание): '
Query = gets.chomp   
# проблемы с кодировкой, принимет только латиницу!!
print 'Введите количество страниц: '
N = gets.chomp.to_i
puts 'Ваш запрос: ' + Query
puts "Количество страниц: #{N}"
puts 'Список полученных ссылок:'
(1..N).each do |page_num|
puts "Страница #{page_num}"
url = open"http://www.google.com/search?q=#{Query}&start=#{(page_num-1)*10}"
doc=Nokogiri::HTML url
links=doc.css('cite')
links.each do |link|
  puts link.text.encode("utf-8")
  # Если ссылки длинные выводит их с многоточием.
end
puts
end
