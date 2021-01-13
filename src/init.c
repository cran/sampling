#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void str(void *, void *, void *, void *);

static const R_CMethodDef CEntries[] = {
    {"str", (DL_FUNC) &str, 4},
    {NULL, NULL, 0}
};

void R_init_sampling(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
