#ifndef OUROBOROS_H
#define OUROBOROS_H

#define PERL_NO_GET_CONTEXT
#define NO_XSLOCKS
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

typedef struct {
        SV **sp;
        SV **mark;
        int ax;
        int items;
} ouroboros_stack_t;

typedef void (*ouroboros_xcpt_callback_t)(void *);

/* functions { */
void ouroboros_stack_init(pTHX_ ouroboros_stack_t*);
int ouroboros_stack_items(pTHX_ ouroboros_stack_t*);
void ouroboros_stack_prepush(pTHX_ ouroboros_stack_t*);
void ouroboros_stack_putback(pTHX_ ouroboros_stack_t*);
SV* ouroboros_stack_fetch(pTHX_ ouroboros_stack_t*, SSize_t);
void ouroboros_stack_store(pTHX_ ouroboros_stack_t*, SSize_t, SV*);
void ouroboros_stack_extend(pTHX_ ouroboros_stack_t*, SSize_t);
void ouroboros_stack_pushmark(pTHX_ ouroboros_stack_t*);
void ouroboros_stack_spagain(pTHX_ ouroboros_stack_t*);
void ouroboros_stack_xpush_sv(pTHX_ ouroboros_stack_t*, SV*);
void ouroboros_stack_xpush_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);
void ouroboros_stack_xpush_iv(pTHX_ ouroboros_stack_t*, IV);
void ouroboros_stack_xpush_uv(pTHX_ ouroboros_stack_t*, UV);
void ouroboros_stack_xpush_nv(pTHX_ ouroboros_stack_t*, NV);
void ouroboros_stack_xpush_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);
void ouroboros_stack_push_sv(pTHX_ ouroboros_stack_t*, SV*);
void ouroboros_stack_push_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);
void ouroboros_stack_push_iv(pTHX_ ouroboros_stack_t*, IV);
void ouroboros_stack_push_uv(pTHX_ ouroboros_stack_t*, UV);
void ouroboros_stack_push_nv(pTHX_ ouroboros_stack_t*, NV);
void ouroboros_stack_push_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);
IV ouroboros_sv_iv(pTHX_ SV*);
UV ouroboros_sv_uv(pTHX_ SV*);
NV ouroboros_sv_nv(pTHX_ SV*);
const char* ouroboros_sv_pv(pTHX_ SV*, STRLEN*);
const char* ouroboros_sv_pv_nolen(pTHX_ SV*);
U32 ouroboros_sv_rok(pTHX_ SV*);
SV* ouroboros_sv_rv(pTHX_ SV*);
IV ouroboros_sv_type(pTHX_ SV*);
SV* ouroboros_gv_sv(pTHX_ GV*);
AV* ouroboros_gv_av(pTHX_ GV*);
HV* ouroboros_gv_hv(pTHX_ GV*);
CV* ouroboros_gv_cv(pTHX_ CV*);
const char* ouroboros_he_pv(pTHX_ HE*, STRLEN*);
SV* ouroboros_he_val(pTHX_ HE*);
U32 ouroboros_he_hash(pTHX_ HE*);
SV* ouroboros_he_svkey(pTHX_ HE*);
SV* ouroboros_he_svkey_force(pTHX_ HE*);
SV* ouroboros_he_svkey_set(pTHX_ HE*, SV*);
U32 ouroboros_perl_hash(pTHX_ U8*, STRLEN);
U32 ouroboros_sv_refcnt(pTHX_ SV*);
SV* ouroboros_sv_refcnt_inc(pTHX_ SV*);
SV* ouroboros_sv_refcnt_inc_nn(pTHX_ SV*);
void ouroboros_sv_refcnt_inc_void(pTHX_ SV*);
void ouroboros_sv_refcnt_inc_void_nn(pTHX_ SV*);
void ouroboros_sv_refcnt_dec(pTHX_ SV*);
void ouroboros_sv_refcnt_dec_nn(pTHX_ SV*);
void ouroboros_enter(pTHX);
void ouroboros_leave(pTHX);
void ouroboros_savetmps(pTHX);
void ouroboros_freetmps(pTHX);
void ouroboros_sys_init3(int*, char***, char***);
void ouroboros_sys_term();
int ouroboros_xcpt_try(pTHX_ ouroboros_xcpt_callback_t, void*);
void ouroboros_xcpt_rethrow(pTHX_ int);
/* } */

#endif
