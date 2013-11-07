void str(double *st, int *h, int *n, double *s)
{
int i;
for(i = 0; i < *n; i++)
       {s[i]=0;
	if(st[i]==*h)
		s[i] = 1;
       }
}

