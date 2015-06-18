# Read me
This repo contains a [R](http://www.r-project.org/) [script](./run_analysis.R) to transform the raw data from the [UCI](http://archive.ics.uci.edu/ml/index.html)'s [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) in a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) ready to analysis. A [Code Book](./Codebook.md) with details about the raw data, the [transformations applied](./Codebook.md#transformation-info) to it and the [resulting tidy data set](./Codebook.md#code-book-1) is provided as well.

If you want to run the script in your own machine, keep reading.

## How to execute `run_analysis.R`

Clone this repo
```
$ git clone https://github.com/gmgall/get-and-cleaning-data-prj.git
```

From a R shell, change the working directory to the newly created `get-and-cleaning-data-prj` directory and run
```
> setwd("get-and-cleaning-data-prj")
> source("run_analysis.R")
```

If you have a `UCI HAR Dataset` subdirectory inside your working directory, the data will be read from it. If not, the script will ask permission to download it and unzip it.
```
> source("run_analysis.R")
Couldn't find the 'UCI HAR Dataset' directory
Download it? [y/n]
```

The output of `run_analysis.R` will be the `tidy_data_set.txt` file.

## Reading the output data set in R

If you want to read the `tidy_data_set.txt` file in R use
```
> data <- read.table(file_path, header = TRUE)
```