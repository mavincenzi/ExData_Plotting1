## reading the data
hpc <- read.table("household_power_consumption.txt",sep=";", header=TRUE)

head(hpc)
str(hpc)



## converting the date (factor) to date format
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
str(hpc)

## subsetting the original Data Frame
hpcs <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")

## checking and comparing
dim(hpc)
dim(hpcs)
str(hpcs)

head(hpc)
head(hpcs)


## converting the Global Active Power (factor) to numeric format
hpcs$Global_active_power <- as.numeric(levels(hpcs$Global_active_power))[hpcs$Global_active_power]
summary(hpcs$Global_active_power)

## converting the Global Reactive Power (factor) to numeric format
hpcs$Global_reactive_power <- as.numeric(levels(hpcs$Global_reactive_power))[hpcs$Global_reactive_power]
summary(hpcs$Global_reactive_power)

## converting the Voltage (factor) to numeric format
hpcs$Voltage <- as.numeric(levels(hpcs$Voltage))[hpcs$Voltage]
summary(hpcs$Voltage)

## converting the Sub_metering_1 (factor) to numeric format
hpcs$Sub_metering_1 <- as.numeric(levels(hpcs$Sub_metering_1))[hpcs$Sub_metering_1]
summary(hpcs$Sub_metering_1)

## converting the Sub_metering_2 (factor) to numeric format
hpcs$Sub_metering_2 <- as.numeric(levels(hpcs$Sub_metering_2))[hpcs$Sub_metering_2]
summary(hpcs$Sub_metering_2)

summary(hpcs$Sub_metering_3)


# Second plot: Scatter plot (with lines) of Global_active_plot x Weekday

## creating the weekday
## Converting the Time (factor) to time format

hpcs$time2 <- strptime(paste(hpcs$Date, hpcs$Time), "%Y-%m-%d %T")


par(mfrow=c(1,1))  # set the number of plots
with(hpcs, plot(time2,Global_active_power, mar=c(2, 4.1, 2, 2.1),type="l",xlab="",ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file 
dev.off()  ## Closing the PNG device


