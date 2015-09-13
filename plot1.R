#plot1 <- function()

dFile <- "./data/household_power_consumption.txt"
dataset <- as.data.frame(read.csv(dFile,header=TRUE,sep=";"))

  dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")
  stdate <- as.Date("2007-02-01")
  endate <- as.Date("2007-02-02")

  i <- 66500 # this is hardcoded but can be made into function to find exact i to start from
  flag <- 1
  data_sub <- NULL
  while(dataset[i,1]-endate <= 0)
  {
    if(stdate - dataset[i,1] <=0)
    {
      if(flag==1)
      {
        p <- i
        flag <- 0
      }
      q <- i
    }
    i <- i + 1
  }
  data_sub <- dataset[p:q,]
#  print (nrow(data_sub))
  data_sub$Global_active_power <- as.numeric(data_sub[,3])
  data_sub$Global_active_power <- data_sub$Global_active_power/500
  png("plot1.png", width=480, height=480)
  hist(data_sub$Global_active_power,col="red",main="Global Active Power",freq=TRUE,breaks=20,xlab="Global Active Power(kilowatt)")
#  title("Global Active Power")
  dev.off()