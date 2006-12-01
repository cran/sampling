HTestimator=function (y, pik, s) 
{
if(length(y)==sum(s))
crossprod(y, s[s == 1]/pik[s == 1])
else 
crossprod(y[s == 1], s[s == 1]/pik[s == 1])
}

