# Your two vectors
vector1 <- c("a1", "a2", "b1")
vector2 <- c("a1", "b1")

# Find the indices of vector2 elements in vector1
indices <- match(vector2, vector1)

# Replace elements in vector2 with their corresponding indices
vector2_replaced <- ifelse(!is.na(indices), indices, vector2)

# Print the result
print(vector2_replaced)
