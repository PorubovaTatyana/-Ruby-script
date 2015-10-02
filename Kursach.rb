# coding: utf-8
require 'rubygems' 
require 'nokogiri'
require 'open-uri'

puts 'Ruby-скрипт для выделения текстов из статей'
# Написать скрипт, формирующий список уникальных ссылок из выдачи google.

print 'Введите ваш запрос: '
Query = gets.chomp   # проблемы с кодировкой, принимет только латиницу!!

print 'Введите количество страниц: '
N = gets.chomp.to_i

# Скрипт получает  запрос (Query)  от  пользователя, отправляет  в  поисковик google
# Выбирает неповторяющиеся ссылки с первых N  страниц поисковой  выдачи google
doc = Nokogiri::HTML(open('http://www.google.com/search?q'+Query),'UTF-8')
doc.css('h3.r a.l').each do |link|
  puts link.content
end

puts 'Ваш запрос: ' + Query
puts "Количество страниц: #{N}"

puts 'Список полученных ссылок:'
puts doc
# Выводит на экран список ссылок


