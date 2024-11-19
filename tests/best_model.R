test = list(
  name = "best_model",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 4,
      code = {
        testthat::expect_true(
            "workflow" %in% class(best_lm) && !"last_fit" %in% class(best_lm),
            info = "FEEDBACK: best_lm should be a workflow, don't use last_fit() yet. At this step, we're merely finding the best *way* to fit the model, not the best model."
        )

        testthat::expect_true(
            "workflow" %in% class(best_rf) && !"last_fit" %in% class(best_rf),
            info = "FEEDBACK: best_rf should be a workflow, don't use last_fit() yet. At this step, we're merely finding the best *way* to fit the model, not the best model."
        )

        testthat::expect_true(
          !best_lm$trained & !best_rf$trained,
          info = "FEEDBACK: Don't use last_fit() yet. At this step, we're merely finding the best *way* to fit the model, not the best model."
        )
      }
    )
  )
)
