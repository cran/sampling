"checkcalibration" <-
function(Xs,piks,t,g)
{
EPS=0.00001;
tr=c(t(g/piks) %*% Xs);
ee=t(tr-t)%*% (tr-t)
if(ee<EPS) ff=TRUE else ff=FALSE
ff
}

