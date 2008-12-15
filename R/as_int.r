.as_int<-function(x)
{if(!is.integer(x)) {
            xo =x
            x = round(x)
            if(any(x > .Machine$integer.max))
                stop("the input has entries too large to be integer")
            if(!identical(TRUE, (ax <- all.equal(xo, x))))
                warning("the sum of pik has been rounded to integer: ", ax)
            storage.mode(x) <- "integer"
        }
x
}
