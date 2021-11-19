#loading the package
library(xml2)
library(rvest)
library(stringr)
url<-"https://www.amazon.in/Certified-Refurbished-OnePlus-Mirror-Storage/ dp/B07D813XWY/ref=dp_fod_1?pd_rd_i=B07D813XWY&psc=1"
webpage <- read_html(url)
#titele
title_html <- html_nodes(webpage, 'h1#title')
title <- html_text(title_html)
head(title)
str_replace_all(title, "[\r\n]" , "")
print(head(title))

#price
price_html <- html_nodes(webpage, 'span#priceBlockDealPriceString')
price <- html_text(price_html)
print(price)
str_replace_all(title, "[\r\n]" , "")
head(price)

#desc
desc_html <- html_nodes(webpage, 'div#feature-bullets')
desc <- html_text(desc_html)
desc <- str_replace_all(desc, "[\r\n\t]" , "")
desc <- str_trim(desc)
head(desc)
#rate
rate_html <- html_nodes(webpage, 'span#acrPopover')
rate <- html_text(rate_html)
rate <- str_replace_all(rate, "[\r\n]" , "")
rate <- str_trim(rate)
head(rate)
#size
size_html <- html_nodes(webpage, 'div#productOverview_feature_div') size <- html_text(size_html)
head(size)
#color
color_html <- html_nodes(webpage, 'span#productTitle')
color<- html_text(color_html)
color<- str_trim(color)
head(color)
product_data <- data.frame(Title = title, Price = price,Description = desc, Rating = rate, Size = size, Color = color)
str(product_data)
library(jsonlite)
json_data <- toJSON(product_data)
cat(json_data)
