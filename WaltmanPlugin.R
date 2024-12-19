
library(dplyr)
library(Seurat)
library(patchwork)



dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {
	pbmc <- readRDS(paste(pfix, parameters["rdsfile", 2], sep="/"))
	resolution = as.numeric(parameters["resolution", 2])
pbmc <- FindClusters(pbmc, resolution = resolution)
saveRDS(pbmc, outputfile)
}
