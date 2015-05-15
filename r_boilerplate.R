#Summary: R Style Rules                                                         #
# http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#examplefunction  #
#################################################################################

##File Names: end in .R
##Identifiers: variable.name (or variableName), FunctionName, kConstantName
##Line Length: maximum 80 characters
##Indentation: two spaces, no tabs
##Spacing
##Curly Braces: first on same line, last on own line
##else: Surround else with braces
##Assignment: use <-, not =
##  Semicolons: don't use them
##General Layout and Ordering
##Commenting Guidelines: all comments begin with # followed by a space inline comments need two spaces before the #
##Function Definitions and Calls
##Function Documentation
##Example Function
##TODO Style: TODO(username)


###R Template:###  
#################
#################

#1# Load Relavent Packages & set workspace:
####################
## dplyr- data manipulation library. help and tutorials, enter: browseVignettes(package = "dplyr") or http://127.0.0.1:15214/library/dplyr/doc/introduction.html
library(dplyr)
##curl- for downloading data
library(curl) 
##tidyr
library(tidyr)

##set working directory
getwd()


##create project folders
dir.create("project_projectname", showWarnings = TRUE, recursive = FALSE)
dir.create("project_projectname/data", showWarnings = TRUE, recursive = FALSE)
dir.create("project_projectname/graphics", showWarnings = TRUE, recursive = FALSE)

##Create Readme & Codebook
setwd("project_projectname")
file.create("readme.txt")
writeLines(c("Readme for project_projectname","created"), "readme.txt")

file.create("codebook.md")
writeLines(c("Codebook for projectname","=============="), "codebook.md")


#2# Load dataset:
####################

#dataset from package
library(nameofpackage)

#load from web
fileUrl <- "https://example.com/dataset.txt"
download.file(fileUrl, destfile="./data/newnameofdata.txt", method="curl")


#load from web & unzip
url <- "https://example.com/dataset.zip"
file <- file.path(getwd(), "mynewdataname.zip")
download.file(url, file, mode="wb")
unzip (file, exdir = "./data", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE,unzip = "internal", setTimes = FALSE)

##Read datatypes examples:

###tab-delimited table
mydata_name <- read.table("./data/filename", header = TRUE)

###csv
mydata_name <- read.csv("./data/filename", header = TRUE, sep = ";")

###unspecified & oddball formats
file.choose("./data/filename")
img <- readJPEG('img.jpg', native = TRUE)

##Give a recap of the raw data##
Load(mydata_name) 
dim(mydata_name) #shows dimensions of package
names(mydata_name)   ##colnames
summary(mydata_name) ###displays min, median, mean, max of data cols
head() #top bit of the data
length(mydata_name$rowname)
table(mydata_name)

#3# Clean Dataset:
####################

###tidyr fucntions
####Gather
gather(rownames, na.rm = TRUE) # na.rm drops missing values

####Gather
arrange(col1, col2, col3)

####Mutate dates
mutate(
  week = extract_numeric(colname),
  date = as.Date(date.entered) + 7 * (colname - 1)) %>%
  select(-date.entered)

#separate  splits a compound variables into individual var
separate()

#remove tables from enviroment
rm("")

#4# Manipulate Dataset:
####################

#Merge Data: 
tmp1 <- read.table("train/file1.txt")
tmp2 <- read.table("test/file2.txt")
X <- rbind(tmp1, tmp2)


#arrange data:
new_dataset<-arrange(dataname,desc(colname))


###dplyr basics:
#####Select columns: select() . Helper functions: starts_with(), ends_with(), matches() to select with criteria
#####to rename columns: rename() ex: rename(flights, tail_num = tailnum)
#####Filter rows with: filter(), 
#####select rows by position, use slice()
#####reorder/Arrange rows with: arrange(), descending order: desc() 
#####Extract distinct/unique rows: distinct()
#####new columns with: mutate() 
#####new column, new variables: transmute()
#####collapses a data frame to a single row: summarise()
#####optional: Randomly sample rows: sample_n() sample_frac()


#clean output
write.table(result,"mynewdata.txt")

#group variables
group_by(dataname, colname)

#Sum fields:
  summarize(dataname, calculation_function(column))
  #Some variable to use in summarize()
  n() #"number of"
  n_distinct() #number of unique values
  mean()#avg
  quantile(dataname$column, probs = 0.99) #We need to know the value of 'count' that splits the data into the top 1% and bottom 99% of packages based on total downloads. In statistics, this is called the 0.99, or 99%, sample quantile. Use quantile(pack_sum$count, probs = 0.99) to determine this number
  filter(dataname, colum > 679) #add column and filter cireteria in second half, > is an example
  View(dataname)#to show whole dataset(works with rstudio only)

#multiple function calls

%>% #chains the function calls in a linear fashion. example:
  result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)



#5# State Function:
####################
CalculateSampleCovariance <- function(x, y, verbose = TRUE) {#5.1# brief summary of actions
##5.2# Arguments:
  #   x: One of two vectors whose sample covariance is to be calculated.
  #   y: The other vector. x and y must have the same length, greater than one,
  #      with no missing values.
  #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
  
##5.3# "common english" version of arguments
##5.4# Summary of what the function will return
##5.5# the code for output
  n <- function(x)
}




#Example Function syntax#

CalculateSampleCovariance <- function(x, y, verbose = TRUE) {
  # Computes the sample covariance between two vectors.
  #
  # Args:
  #   x: One of two vectors whose sample covariance is to be calculated.
  #   y: The other vector. x and y must have the same length, greater than one,
  #      with no missing values.
  #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
  #
  # Returns:
  #   The sample covariance between x and y.
  n <- length(x)
  # Error handling
  if (n <= 1 || n != length(y)) {
    stop("Arguments x and y have different lengths: ",
         length(x), " and ", length(y), ".")
  }
  if (TRUE %in% is.na(x) || TRUE %in% is.na(y)) {
    stop(" Arguments x and y must not have missing values.")
  }
  covariance <- var(x, y)
  if (verbose)
    cat("Covariance = ", round(covariance, 4), ".\n", sep = "")
  return(covariance)
}

#6# Graph stuff:
####################

library("graphics")#basic
library(ggplot2)#advanced funct. easier, types listed below:

####types of graphs:
barplot()
boxplot()
hist()
pie()
plot()
plot(type="b")

#formatting
graphtype(
  xlab=""
  ylab=""
  las=1
  pch="."#pch=1:25#characters
  cex=0.5 #size
  col=#colors #to see list, type colors()
  type="l"#line graph
  type="b"#line graph with points
  lty=""#line type
  lwd=""#line width
  )
#add ab line:
abline(lm(x~y))

#basic size parameters
par(mar=c(5,4,4,4))

#
par(new=TRUE)

#x axis lable
mtext(side=4, line=2.5,"Timber volume (cubic feet)", xpd=TRUE)

