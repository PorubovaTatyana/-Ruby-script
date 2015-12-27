# coding: utf-8
require 'rubygems' 
require 'nokogiri'
require 'open-uri'

puts 'Ruby-скрипт для выделения текстов из статей'

# часть 1
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
	ad='D:/MMAD/links_file.txt'
	File.open(ad, 'a'){ |f| f.write("#{link.text}\n") }
end
puts
end
# часть 2
print 'Введите ссылку. Ссылка должна начинаться с: http://(ссылка): '
ssylka = gets.chomp 
url = open"#{ssylka}"
page = Nokogiri::HTML(url) 
pagetext = page.css('body')
pagetext.each do |txt|
tx = txt.css('p').text.strip 
puts tx 
# часть 3
ad='D:/MMAD/text_file.txt'
	File.open(ad, 'a'){ |f| f.write("#{tx.encode("utf-8")}\n") }
end