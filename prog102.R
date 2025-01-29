library(marinecs100b)
# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2020-07-30 00:00:00 -08", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2020-07-30 23:59:00 -0", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
# calling the smaller thing from the bigger thing- indexing
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)
# P2: Fill in the blanks below to write the Alaskan datetime utility function.
extract_datetime <- function(Alaskan_datetime) {
  Alaskan_datetime_output <- as.POSIXct(Alaskan_datetime, tz= "Etc/GMT+8")
    return(Alaskan_datetime_output)
}
extract_datetime("2020-02-02 16:00")
# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01
Aialik_day_start <- as.POSIXct("2020-02-02 00:00:00 -08", tz = "Etc/GMT+8")
Aialik_day_end <- as.POSIXct("2020-02-02 23:59:00 -0", tz = "Etc/GMT+8")
Aialik_site <- kefj_site == "Aialik" &
  kefj_datetime >= Aialik_day_start &
  kefj_datetime <= Aialik_day_end
hotday_datetime <- kefj_datetime[Aialik_site]
hotday_temperature <- kefj_temperature[Aialik_site]
Aialik_exposure <- kefj_exposure[Aialik_site]
plot_kefj(hotday_datetime, hotday_temperature, Aialik_exposure)
# calling the smaller thing from the bigger thing- indexing
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.
site <- "Harris"
Harris_day_start <- as.POSIXct("2016-04-05 00:00:00 -08", tz = "Etc/GMT+8")
Harris_day_end <- as.POSIXct("2016-04-05 23:59:00 -0", tz = "Etc/GMT+8")
Harris_site <- kefj_site == "Harris" &
  kefj_datetime >= Harris_day_start &
  kefj_datetime <= Harris_day_end
hotday_datetime <- kefj_datetime[Harris_site]
hotday_temperature <- kefj_temperature[Harris_site]
Harris_exposure <- kefj_exposure[Harris_site]
plot_kefj(hotday_datetime, hotday_temperature, Harris_exposure)

# P5: Compare your solutions for P3 and P4 - what variables changed?

# The variables with different values were site, start, and end
# The site changed, no air exposure in the first graph.

# P6: What you would pick for the temperature extraction function and
# parameters' names?

# function name = extract_temp, parameter names = site, start, end

# extract_temperature(site, date)

# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

extract_temperature <- function(site, start, end) {
  start <- as.POSIXct(start, tz = "Etc/GMT+8")
  end <- as.POSIXct(end, tz = "Etc/GMT+8")
  site_idx <- kefj_site == site &
    kefj_datetime >= start &
    kefj_datetime <= end
  results <- kefj_temperature[site_idx]
    return(results)
}
extract_temperature("Harris", "2016-04-05 00:00:00", "2016-04-05 23:59:00")

# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.

#everything the same besides the temperature; it becomes date

extract_date <- function(site, start, end) {
  start <- as.POSIXct(start, tz = "Etc/GMT+8")
  end <- as.POSIXct(end, tz = "Etc/GMT+8")
  site_idx <- kefj_site == site &
    kefj_datetime >= start &
    kefj_datetime <= end
  results <- kefj_datetime[site_idx]
  return(results)
}
  extract_date("Harris", "2016-04-05 00:00", "2016-04-05 23:59")

  extract_exposure <- function(site, start, end) {
    start <- as.POSIXct(start, tz = "Etc/GMT+8")
    end <- as.POSIXct(end, tz = "Etc/GMT+8")
    site_idx <- kefj_site == site &
      kefj_datetime >= start &
      kefj_datetime <= end
    results <- kefj_exposure[site_idx]
    return(results)
  }
  extract_exposure("Harris", "2016-04-05 00:00", "2016-04-05 23:59")


# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)
 #done

# P10: Visualize Nuka Pass on July 1, 2018.
  plot_kefj(extract_date("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
    extract_temp("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"),
    extract_exposure("Nuka_Pass", "2018-07-01 00:00", "2018-07-01 23:59"))

  # I have an error that says Error in convert_to_alaska(start) :
  # could not find function "convert_to_alaska" (What does this mean????????)

# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?
# Prog102 is more concise and organized because we have functions that require
# less lines which avoids making more errors.
# Prog101 has many more variable defenitions which allows room for more errors too
# and Prog 102. In Prog 102 Functions makes it easier to read and maintain and if
# we make an error we only have to correct it once

