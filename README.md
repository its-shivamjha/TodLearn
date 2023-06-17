# Load the ggplot2 package
library(ggplot2)

# Create a sample dataset with Indian names
dataset <- data.frame(
  name = c("Aarav", "Aanya", "Aaradhya", "Advait", "Ananya"),
  age = c(25, 32, 40, 28, 35),
  city = c("Mumbai", "Delhi", "Bangalore", "Chennai", "Kolkata"),
  salary = c(50000, 60000, 70000, 55000, 65000)
)

# Create a scatter plot
scatter_plot <- ggplot(data = dataset, aes(x = age, y = salary)) +
  geom_point() +
  labs(title = "Scatter Plot", x = "Age", y = "Salary")

# Create a bar plot
bar_plot <- ggplot(data = dataset, aes(x = name, y = salary)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Bar Plot", x = "Name", y = "Salary")

# Create a line plot
line_plot <- ggplot(data = dataset, aes(x = age, y = salary, group = name)) +
  geom_line() +
  labs(title = "Line Plot", x = "Age", y = "Salary")

# Create a box plot
box_plot <- ggplot(data = dataset, aes(x = city, y = salary)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Box Plot", x = "City", y = "Salary")


