test = list(
  name = "cyclones_by_name",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 2,
      code = {
        testthat::expect_equal(
            length(names(cyclones_by_name)),
            19,
            info = "FEEDBACK: There should be 19 columns"
        )

        expected_names <- c(
            "Name", "NameYear", "Basin", "start_lat", "start_lon", "end_lat",
            "end_lon", "start_date", "end_date", "lowest_lat", "highest_lat",
            "lowest_lon", "highest_lon", "max_wind", "min_pressure", "max_cat",
            "storm_length", "lat_change", "lon_change"
        )

        testthat::expect_equal(
            sort(names(cyclones_by_name)),
            sort(expected_names),
            info = paste0(
                "FEEDBACK: ",
                setdiff(expected_names, names(cyclones_by_name)),
                "missing, ",
                setdiff(names(cyclones_by_name), expected_names),
                " extra."
            )
        )

      }
    )
  )
)