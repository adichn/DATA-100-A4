test = list(
  name = "cyclones_recipes",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 3,
      code = {
        testthat::expect_true(
            class(cyclones_recipes) == "list",
            info = "FEEDBACK: cyclones_recipes should be a list()."
        )

        testthat::expect_equal(
            length(cyclones_recipes),
            3,
            info = "FEEDBACK: There should be three recipes."
        )

        testthat::expect_true(
            !is.null(names(cyclones_recipes)),
            info = "FEEDBACK: Recipes should be named!"
        )

        terms1 <- cyclones_recipes[[1]]$term_info
        terms2 <- cyclones_recipes[[2]]$term_info
        terms3 <- cyclones_recipes[[3]]$term_info

        testthat::expect_true(
            length(all.equal(terms1, terms2)) > 0 &&
                length(all.equal(terms1, terms3)) > 0 &&
                length(all.equal(terms3, terms2)) > 0,
            info = "FEEDBACK: Recipes cannot be the same!"
        )

        testthat::expect_true(
            (length(terms1) >= 3) && (length(terms2)) >= 3 && (length(terms3) >= 3),
            info = "FEEDBACK: All recipes must have at least three features!"
        )

      }
    )
  )
)