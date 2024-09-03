library(tidymodels)

tidymodels_prefer()
theme_set(theme_bw())

deliveries %>%
  ggplot(aes(x = day, y = time_to_delivery)) +
  geom_boxplot()

ggplot(deliveries, aes(x=hour, y=time_to_delivery, color=day)) +
  geom_point()

ggplot(deliveries, aes(x=hour, y=time_to_delivery, color=day)) +
  geom_point(alpha = 1 / 10) +
  geom_smooth(se = FALSE)

deliveries %>%
  ggplot(aes(x = time_to_delivery)) +
  geom_histogram(col = "white")

deliveries %>%
  pivot_longer(item_01:item_27, names_to = "item", values_to = "qty") %>%
  filter(qty != 0) %>%
  group_by(item) %>%
  summarise(mean_time = mean(time_to_delivery)) %>%
  ggplot() +
  aes(x = item, y = mean_time) +
  geom_bar(stat = "identity")

# ------------------------------------------------------------------------------

food_rec <- recipe(time_to_delivery ~ ., data = delivery_train) %>%
  step_dummy(all_factor_predictors()) %>%
  step_spline_natural(hour, distance, deg_free = 5)

fitted_rec <- prep(food_rec, delivery_train)
val_predictor <- bake(fitted_rec, delivery_val %>% slice(1:2))

# ------------------------------------------------------------------------------

library(rules)

set.seed(483)
fold_10_cv <- vfold_cv(delivery_train, v = 10)

cubist_res <-
  cubist_rules() %>%
  fit_resamples(
    time_to_delivery ~ .,
    resamples = fold_10_cv,
    control = control_resamples(save_pred = TRUE))

collect_metrics(cubist_res)


set.seed(34834)
cubist_tune_res <-
  cubist_rules(committees = tune()) %>%
  tune_grid(
    time_to_delivery ~ .,
    resamples = fold_10_cv,
    control = control_grid(save_pred = TRUE))

autoplot(cubist_tune_res, metric = "rmse")
show_best(cubist_tune_res, metric = "rmse")
