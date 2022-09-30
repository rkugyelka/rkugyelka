#Renaming the fcs files

library("flowCore")

# Example with one file ----

# Read in an example file
file <- read.fcs("~/MDSC_trial/080822_A_001.fcs")

# Check IDs
patient_id <- file@description$`PATIENT ID` #Patient ID
sample_id <- file@description$`SAMPLE ID` # Sample ID
panel_id <- file@description$`PREF GW NAME` #Panel name ?

# Create new filename - ended up not using this
new_filename <- paste(patient_id, sample_id, panel_id, sep= "_" )

# One version with a function - did not really find the changes keyword later 
# keyword(trial, function(x,...) paste(keyword(x, "PATIENT ID"), keyword(x, "SAMPLE ID"), keyword(x, "PREF GW NAME"), sep="_"))

# Assign new filename to "FILENAME" keyword
keyword(trial)[["FILENAME"]] <- paste(keyword(trial, "PATIENT ID"), keyword(trial, "SAMPLE ID"), keyword(trial,"PREF GW NAME"), sep="_")
filename <- paste(keyword(trial)[["FILENAME"]], "fcs", sep=".")

# Write FCS file
write.FCS(trial, filename = filename)

# Renaming all files in MDSC folder

files <- list.files(path = "~/MDSC_trial")

for (m in files) {
  m <- read.FCS(filename = m)
  keyword(m)[["FILENAME"]] <- paste(keyword(m, "PATIENT ID"), keyword(m, "SAMPLE ID"), keyword(m,"PREF GW NAME"), sep="_")
  filename <- paste(keyword(m)[["FILENAME"]], "fcs", sep=".")
  write.FCS(m, filename = filename)
}



# Renaming all files in Treg folder

files <- list.files(path = "~/Treg")

for (t in files) {
  t <- read.FCS(filename = t)
  keyword(t)[["FILENAME"]] <- paste(keyword(t, "PATIENT ID"), keyword(t, "SAMPLE ID"), keyword(t,"PREF GW NAME"), sep="_")
  filename <- paste(keyword(t)[["FILENAME"]], "fcs", sep=".")
  write.FCS(t, filename = filename)
}

# Renaming all files in intra folder

files <- list.files(path = "~/intra")

for (t in files) {
  t <- read.FCS(filename = t)
  keyword(t)[["FILENAME"]] <- paste(keyword(t, "PATIENT ID"), 
                                    keyword(t, "SAMPLE ID"), 
                                    keyword(t,"TUBE NAME"), # this was changed to identify stim vs unstim
                                    sep="_") 
  filename <- paste(keyword(t)[["FILENAME"]], "fcs", sep=".")
  write.FCS(t, filename = filename)
}

# Renaming all files in extra folder

files <- list.files(path = "~/extra")

for (t in files) {
  t <- read.FCS(filename = t)
  keyword(t)[["FILENAME"]] <- paste(keyword(t, "PATIENT ID"), 
                                    keyword(t, "SAMPLE ID"), 
                                    keyword(t,"TUBE NAME"), # this was changed to identify stim vs unstim
                                    sep="_") 
  filename <- paste(keyword(t)[["FILENAME"]], "fcs", sep=".")
  write.FCS(t, filename = filename)
}


