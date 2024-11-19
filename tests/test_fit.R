test = list(
  name = "test_fit",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 2,
      code = {
        testthat::expect_true(
          "last_fit" %in% class(test_lm) && "last_fit" %in% class(test_rf),
          info = "FEEDBACK: test_lm and test_rf should be the output of the last_fit() function."
        )
      }
    )
  )
)