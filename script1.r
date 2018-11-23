# load in data
household_power_consumption <- data.table::fread(input = "../data/household_power_consumption.txt"
                             , na.strings="?")

# change type of date col
household_power_consumption[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# filter to correct time scale
hpc_plot <- household_power_consumption[(Date >= "2007-02-01") & (Date < "2007-02-02")]


### plot 1
png("plot1.png", width=480, height=480)

hist(hpc_plot[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()