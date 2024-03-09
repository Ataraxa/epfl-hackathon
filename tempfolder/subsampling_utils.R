subsample_by_replicate <- function(replicates_list) {
    # Loop over each replicate
    final_list = c() 
    list_repl <- c("Disease_4", "Disease_9", "Control_10", "Control_2", "Control_3" )
    for (type in list_repl){
        indices <- which(replicates_list == type)
        final_list <- c(final_list, sample(indices, size = 8, replace = FALSE))
    }
    return(final_list)
}
