test = list(
  name = "cyclones_workflow_set",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 2,
      code = {
        testthat::expect_true(
            "workflow_set" %in% class(cyclones_workflow_set),
            info = "FEEDBACK: cyclones_workflow_set is not a workflow_set."
        )

        testthat::expect_equal(
            dim(cyclones_workflow_set),
            c(3, 4),
            info = "FEEDBACK: There should be 3 models defined."
        )

        testthat::expect_equal(
            cyclones_workflow_set$info[1][[1]]$model,
            "linear_reg",
            info = "FEEDBACK: Linear model not set!"
        )

        testthat::expect_equal(
            paste0(names(cyclones_recipes), "_lm"),
            cyclones_workflow_set$wflow_id,
            info = "FEEDBACK: Workflow set should use the models in `cyclones_recipes`"
        )

      }
    )
  )
)