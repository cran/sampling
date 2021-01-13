checkcalibration<-function (Xs, d, total, g, EPS = 1e-06) 
{
    if (is.null(g)) 
        stop("the g-weight vector is null")
    if (!is.matrix(Xs)) 
        Xs <- as.matrix(Xs)
    tr <- crossprod(Xs, g * d)
    expression<- max(abs(tr - total)/total)
    if(any(total<=sqrt(.Machine$double.eps))) expression<- max(abs(tr - total))
    if (expression < EPS) {
        result <- TRUE
        message <- "the calibration is done"
        value <- EPS
    }
    else {
        message <- cat("the calibration cannot be done. The max EPS value is given by 'value'.\n")
        value <- expression
        result <- FALSE
    }
    list(message = message, result = result, value = value)
}
