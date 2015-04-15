#This program compiles a list of files, where directory = "     "
#reads data from selected files, where id = "      "
#then finds the mean level of pollutant, where pollutant = "     "

pollutantmean <- function(directory, pollutant, id = 1:332){
    list <- list.files(directory, full.names = TRUE)
    data <- data.frame()
    for (i in id){
        data <- rbind(data, read.csv(list[i]))
    }
    data_p <- data[pollutant]
    colMeans(data_p, na.rm = TRUE)
}
