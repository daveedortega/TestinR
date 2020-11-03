#webscraping
#programmatically read stuff from websites

con<-url('https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en%22')

htmlcode<-readLines(con)
close(con)


library(XML)
library(RCurl)
url<-'https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en%22'
xData<-getURL(url)
doc<-htmlTreeParse(xData,useInternalNodes = TRUE)

xpathSApply(doc,"//title",xmlValue)


#OR
library(httr)
html2=GET(url)
content2=content(html2,as = 'text')
parsedHTML=htmlParse(content2,asText = T)
xpathSApply(parsedHTML,"//title",xmlValue)
#CAN use get on websites which need passwords and authenticate

stuff=GET('http://httpbin.org/basic-auth/user/passwd',authenticate('user','psswd'))
stuff
names(stuff)

#USE HANDLES to save yourself steps, can change paths, cookies stay


