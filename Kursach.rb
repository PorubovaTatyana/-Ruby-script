# coding: utf-8
require 'rubygems' 
require 'nokogiri'
require 'open-uri'

puts 'Ruby-скрипт для выделения текстов из статей'
# Написать скрипт, формирующий список уникальных ссылок из выдачи google.

print 'Введите ваш запрос: '
Query = gets.chomp   
# проблемы с кодировкой, принимет только латиницу!!

print 'Введите количество страниц: '
N = gets.chomp.to_i

puts 'Ваш запрос: ' + Query
puts "Количество страниц: #{N}"

puts 'Список полученных ссылок:'
# Скрипт получает  запрос (Query)  от  пользователя, отправляет  в  поисковик google
# Выбирает неповторяющиеся ссылки с первых N  страниц поисковой  выдачи google
(1..N).each do |page_num|
puts "Страница #{page_num}"
url = open"http://www.google.com/search?q=#{Query}&start=#{(page_num-1)*10}"
doc=Nokogiri::HTML url
links=doc.css('div.s cite')
links.each do |link|
  puts link.content.encode("utf-8")
end
puts
end

# Выводит на экран список ссылок