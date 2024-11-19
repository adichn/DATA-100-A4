test = list(
  name = "lm_versus_rf",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 2,
      code = {
        testthat::expect_true(
            "workflow_set" %in% class(lm_versus_rf),
            info = "FEEDBACK: lm_versus_rf should still be a workflow_set."
        )

        testthat::expect_true(
            any(str_detect(lm_versus_rf$wflow_id, "rf")),
            info = "FEEDBACK: There are no models labelled `rf`. Did you add the random forest model to the list of models, with rf as the name?"
        )

        testthat::expect_true(
            any(str_detect(lm_versus_rf$wflow_id, "lm")),
            info = "FEEDBACK: There are no models labelled `lm`. Did you add the linear model to the list of models, with lm as the name?"
        )

        testthat::expect_equal(
            dim(lm_versus_rf),
            c(6, 4),
            info = "FEEDBACK: There should be 6 models total (three lm and three rf)"
        )

      }
    )
  )
)