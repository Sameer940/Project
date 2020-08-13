library(xml2)
library(rvest)
library(stringr)
scrappedurl<-'https://www.amazon.in/Test-Exclusive-547/dp/B078BNQ318/ref=sr_1_2?dchild=1&keywords=oneplus&qid=1597315346&sr=8-2'
Amazonwebpage<-read_html(scrappedurl)
title<-html_nodes(Amazonwebpage,"h1#title")
til<-html_text(title)
str_replace_all(til,"[\r\n]","")
head(til)


price_html <- html_nodes(Amazonwebpage, "span#priceblock_ourprice")
price <- html_text(price_html)
head(price)
str_replace_all(price,"[\r\n\u20b9]","")


desc_html <- html_nodes(Amazonwebpage, "div#productDescription")
desc <- html_text(desc_html)
desc <- str_replace_all(desc, "[\r\n\t]" , "")
desc <- str_trim(desc)
head(desc)

rate_html <- html_nodes(Amazonwebpage, "span#acrPopover")
rate <- html_text(rate_html)
rate <- str_replace_all(rate, "[\r\n]" , "")
rate <- str_trim(rate)
head(rate)


color_html <- html_nodes(Amazonwebpage, "div#variation_color_name")
color_html <- html_nodes(color_html, "span.selection")
color <- html_text(color_html)
color <- str_trim(color)
head(color)


product_data <- data.frame(Title = str_replace_all(til,"[\r\n]",""), Price = price,Description = desc, Rating = rate, Color = color)
print(product_data)

