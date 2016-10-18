# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

library(dplyr)

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package

library(fueleconomy)


# Which Accura model has the best hwy MPG in 2015? (without method chaining)

acura.cars <- filter(vehicles, make == 'Acura', year == 2015)
high.mpg <- filter(acura.cars, hwy == max(hwy))
best.acura <- select(high.mpg, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)

best.acura <- select(
  filter(
    filter(vehicles, make == 'Acura', year == 2015), hwy == max(hwy)
  ), model
)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)

best.acura <- filter(vehicles, make == 'Acura', year == 2015) %>%
  filter(hwy == max(hwy)) %>%
  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
