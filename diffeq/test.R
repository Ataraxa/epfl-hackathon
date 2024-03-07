empty_vector <- vector("numeric", length = 3)

# Add vectors using cbind
vector1 <- c(1, 2, 3)
vector2 <- c(4, 5, 6)

result <- cbind(empty_vector)
result <- cbind(vector1)
result <- cbind(vector2)
# Print the result
print(result[,-1])