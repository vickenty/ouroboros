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
void ouroboros_stack_xpush_mortal(pTHX_ ouroboros_stack_t*);
void ouroboros_stack_push_sv(pTHX_ ouroboros_stack_t*, SV*);
void ouroboros_stack_push_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);
void ouroboros_stack_push_iv(pTHX_ ouroboros_stack_t*, IV);
void ouroboros_stack_push_uv(pTHX_ ouroboros_stack_t*, UV);
void ouroboros_stack_push_nv(pTHX_ ouroboros_stack_t*, NV);
void ouroboros_stack_push_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);
void ouroboros_stack_push_mortal(pTHX_ ouroboros_stack_t*);
void ouroboros_sv_upgrade(pTHX_ SV*, svtype);
U32 ouroboros_sv_niok(pTHX_ SV*);
U32 ouroboros_sv_niok_priv(pTHX_ SV*);
void ouroboros_sv_niok_off(pTHX_ SV*);
U32 ouroboros_sv_ok(pTHX_ SV*);
U32 ouroboros_sv_iok_priv(pTHX_ SV*);
U32 ouroboros_sv_nok_priv(pTHX_ SV*);
U32 ouroboros_sv_pok_priv(pTHX_ SV*);
U32 ouroboros_sv_iok(pTHX_ SV*);
void ouroboros_sv_iok_on(pTHX_ SV*);
void ouroboros_sv_iok_off(pTHX_ SV*);
void ouroboros_sv_iok_only(pTHX_ SV*);
void ouroboros_sv_iok_only_uv(pTHX_ SV*);
bool ouroboros_sv_iok_uv(pTHX_ SV*);
bool ouroboros_sv_uok(pTHX_ SV*);
bool ouroboros_sv_iok_not_uv(pTHX_ SV*);
U32 ouroboros_sv_nok(pTHX_ SV*);
void ouroboros_sv_nok_on(pTHX_ SV*);
void ouroboros_sv_nok_off(pTHX_ SV*);
void ouroboros_sv_nok_only(pTHX_ SV*);
U32 ouroboros_sv_pok(pTHX_ SV*);
void ouroboros_sv_pok_on(pTHX_ SV*);
void ouroboros_sv_pok_off(pTHX_ SV*);
void ouroboros_sv_pok_only(pTHX_ SV*);
void ouroboros_sv_pok_only_utf8(pTHX_ SV*);
bool ouroboros_sv_vok(pTHX_ SV*);
U32 ouroboros_sv_ook(pTHX_ SV*);
U32 ouroboros_sv_rok(pTHX_ SV*);
void ouroboros_sv_rok_on(pTHX_ SV*);
void ouroboros_sv_rok_off(pTHX_ SV*);
IV ouroboros_sv_iv(pTHX_ SV*);
IV ouroboros_sv_iv_nomg(pTHX_ SV*);
IV ouroboros_sv_iv_raw(pTHX_ SV*);
void ouroboros_sv_iv_set(pTHX_ SV*, IV);
UV ouroboros_sv_uv(pTHX_ SV*);
UV ouroboros_sv_uv_nomg(pTHX_ SV*);
UV ouroboros_sv_uv_raw(pTHX_ SV*);
void ouroboros_sv_uv_set(pTHX_ SV*, UV);
NV ouroboros_sv_nv(pTHX_ SV*);
NV ouroboros_sv_nv_nomg(pTHX_ SV*);
NV ouroboros_sv_nv_raw(pTHX_ SV*);
void ouroboros_sv_nv_set(pTHX_ SV*, NV);
const char* ouroboros_sv_pv(pTHX_ SV*, STRLEN*);
const char* ouroboros_sv_pv_nomg(pTHX_ SV*, STRLEN*);
const char* ouroboros_sv_pv_nolen(pTHX_ SV*);
const char* ouroboros_sv_pv_nomg_nolen(pTHX_ SV*);
char* ouroboros_sv_pv_raw(pTHX_ SV*);
STRLEN ouroboros_sv_pv_cur(pTHX_ SV*);
void ouroboros_sv_pv_cur_set(pTHX_ SV*, STRLEN);
STRLEN ouroboros_sv_pv_len(pTHX_ SV*);
void ouroboros_sv_pv_len_set(pTHX_ SV*, STRLEN);
char* ouroboros_sv_pv_end(pTHX_ SV*);
SV* ouroboros_sv_rv(pTHX_ SV*);
void ouroboros_sv_rv_set(pTHX_ SV*, SV*);
bool ouroboros_sv_true(pTHX_ SV*);
bool ouroboros_sv_true_nomg(pTHX_ SV*);
IV ouroboros_sv_type(pTHX_ SV*);
UV ouroboros_sv_flags(pTHX_ SV*);
bool ouroboros_sv_utf8(pTHX_ SV*);
void ouroboros_sv_utf8_on(pTHX_ SV*);
void ouroboros_sv_utf8_off(pTHX_ SV*);
U32 ouroboros_sv_is_cow(pTHX_ SV*);
bool ouroboros_sv_is_cow_shared_hash(pTHX_ SV*);
bool ouroboros_sv_tainted(pTHX_ SV*);
void ouroboros_sv_tainted_on(pTHX_ SV*);
void ouroboros_sv_tainted_off(pTHX_ SV*);
void ouroboros_sv_taint(pTHX_ SV*);
U32 ouroboros_sv_get_a_magic(pTHX_ SV*);
void ouroboros_sv_magic_set(pTHX_ SV*, MAGIC*);
void ouroboros_sv_get_magic(pTHX_ SV*);
void ouroboros_sv_set_magic(pTHX_ SV*);
SV* ouroboros_gv_sv(pTHX_ GV*);
AV* ouroboros_gv_av(pTHX_ GV*);
HV* ouroboros_gv_hv(pTHX_ GV*);
CV* ouroboros_gv_cv(pTHX_ CV*);
HV* ouroboros_sv_stash(pTHX_ SV*);
void ouroboros_sv_stash_set(pTHX_ SV*, HV*);
void ouroboros_cv_stash(pTHX_ CV*);
const char* ouroboros_hv_name(pTHX_ HV*);
STRLEN ouroboros_hv_name_len(pTHX_ HV*);
unsigned char ouroboros_hv_name_utf8(pTHX_ HV*);
const char* ouroboros_hv_ename(pTHX_ HV*);
STRLEN ouroboros_hv_ename_len(pTHX_ HV*);
unsigned char ouroboros_hv_ename_utf8(pTHX_ HV*);
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
SV* ouroboros_sv_undef(pTHX);
SV* ouroboros_sv_no(pTHX);
SV* ouroboros_sv_yes(pTHX);
U32 ouroboros_gimme(pTHX);
int ouroboros_xcpt_try(pTHX_ ouroboros_xcpt_callback_t, void*);
void ouroboros_xcpt_rethrow(pTHX_ int);
/* } */

#endif
