test = list(
  name = "cyclones_split",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 2,
      code = {
        testthat::expect_equal(
          sort(class(cyclones_split)),
          sort(c("initial_validation_split", "three_way_split")),
          info = "FEEDBACK: Object isn't made using `initial_validation_split()`"
        )

        testthat::expect_true(
            abs(length(cyclones_split$train_id) - 0.6 * nrow(cyclones_by_name)) < 3,
            info = "FEEDBACK: Training data is not 60% of the original data."
        )

        testthat::expect_true(
            abs(length(cyclones_split$val_id) - 0.2 * nrow(cyclones_by_name)) < 3,
            info = "FEEDBACK: Validation data is not 20% of the original data."
        )


      }
    )
  )
)