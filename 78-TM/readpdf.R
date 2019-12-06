#read pdf documents

#https://data.library.virginia.edu/reading-pdf-files-into-r-for-text-mining/
#https://www.charlesbordet.com/en/extract-pdf/#use-the-tm-package

#install.packages("pdftools")
library(pdftools)
library(dplyr)

#------
library(pdftools)
download.file("https://github.com/Huitziii/crispy-pdf/raw/master/71_PV.62.pdf", "./71_PV.62.pdf")
text <- pdf_text("./71_PV.62.pdf")








files <- list.files(pattern = "pdf$")
files
grepl(".pdf",files)
#pdf_list <- file_vector[grepl(".pdf",file_list)]

pdf_text("placement.pdf")
text <- pdf_text("placement.pdf") %>% strsplit(split = "\n")

text2 <- strsplit(text, "\n")

opinions <- lapply(files, pdf_text)
library(tm)
corp <- Corpus(URISource(files), readerControl = list(reader = readPDF))

#-------------
uri <- paste0("file://", system.file(file.path("doc", "tm.pdf"), package = "tm"))
engine <- if(nzchar(system.file(package = "pdftools"))) {  "pdftools" 
} else {  "ghostscript"}
reader <- readPDF(engine)
pdf <- reader(elem = list(uri = uri), language = "en", id = "id1")
cat(content(pdf)[1])
VCorpus(URISource(uri, mode = ""),readerControl = list(reader = readPDF(engine = "ghostscript")))

#https://cran.r-project.org/web/packages/textmining/textmining.pdf
