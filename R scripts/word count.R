

word.count <- function (string){
  sapply(
    gregexpr("[[:alpha:]]+", string), ## finds the index of the start of words
                                      ## returns a vector with the first element
                                      ## being a vector of the index of the start of words
                                      ## naturally, that vector has length = word count
    
    function(x){sum(x>0)} ## since all indexes are greater than 0, x>0 will return
                          ## a vector of true/1
                          ## this function then sums the 1s up
    
    )## sapply: applies the function to all elements of the vector
     ## but in this case there's only 1 element in gregexpr(...)
     ## the function gets applied to the first element (with length = word count)
}