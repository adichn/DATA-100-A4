test = list(
  name = "cyclones_fit",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 3,
      code = {
        testthat::expect_true(
            "workflow_set" %in% class(cyclones_fit),
            info = "FEEDBACK: cyclones_fit is not a workflow_set."
        )

        testthat::expect_true(
            "resample_results" %in% class(cyclones_fit$result[[1]]),
            info = "FEEDBACK: The results are not based on `resamples`. Perhaps you forgot to use workflow_map() with the relevant options set?"
        )

        testthat::expect_true(
            "tune_results" %in% class(cyclones_fit$result[[1]]),
            info = "FEEDBACK: The results are not fit with `\"tune_grid\"`. Perhaps you forgot to use workflow_map() with the relevant options set?"
        )

        testthat::expect_equal(
            dim(cyclones_fit),
            c(3, 4),
            info = "FEEDBACK: cyclones_fit should have three models."
        )

        testthat::expect_equal(
            cyclones_fit$option[[1]][[1]]$id,
            "validation",
            info = "FEEDBACK: validation_set() should be used for the \"resamples\" option."
        )

        testthat::expect_equal(
            cyclones_fit$result[[1]]$id,
            "validation",
            info = "FEEDBACK: validation_set() should be used for the \"resamples\" option."
        )

        testthat::expect_equal(
            cyclones_fit$result[[1]]$.metrics[[1]]$.metric,
            c("rmse", "rsq"),
            info = "FEEDBACK: Metrics not calculated, something has gone wrong. Make sure you used `workflow_map()` with the `\"tune_grid\"` function (`fn`)."
        )
      }
    )
  )
)