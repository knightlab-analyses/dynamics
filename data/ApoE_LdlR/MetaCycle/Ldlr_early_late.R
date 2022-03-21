library(MetaCycle)
setwd("../callaband/Desktop/UCSD/ZarrinparLab/Dynamics/data/ApoE_LdlR/")

micro_early = read.table("./MetaCycle/wUF_distance_early_mc.txt", 
                     header = T, sep="\t", row.names = 1)
micro_late = read.table("./MetaCycle/wUF_distance_late_mc.txt", 
                     header = T, sep="\t", row.names = 1)

str(micro_early)

micro_early_file = "./MetaCycle/wUF_distance_early_mc.txt"
micro_late_file = "./MetaCycle/wUF_distance_late_mc.txt"
metaout = "./MetaCycle/metaout/"

my_timepoints1 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(micro_early))))
my_timepoints2 = as.numeric(gsub("X", "", gsub("\\..", "", colnames(micro_late))))
#list of zt times

meta2d(infile=micro_early_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints1, 
       cycMethod = "LS")

meta2d(infile=micro_late_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints2, 
       cycMethod = "LS")

#JTK method didn't work on auto settings

meta2d(infile=micro_early_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints1, analysisStrategy="selfUSE",
       cycMethod = "JTK")

meta2d(infile=micro_late_file, outdir=metaout, filestyle='txt', 
       timepoints = my_timepoints2, analysisStrategy="selfUSE",
       cycMethod = "JTK")
