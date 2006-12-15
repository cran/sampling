"checkcalibration" <-
function(Xs,pik,t,g)
{
EPS=1e-6
tr=crossprod(Xs,g/pik)
ee=t(tr-t)%*% (tr-t)
(ee<EPS)[1] 
}

