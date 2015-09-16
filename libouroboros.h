#ifndef OUROBOROS_H
#define OUROBOROS_H

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

struct ouroboros_stack {
        SV **sp;
        SV **mark;
        int ax;
        int items;
};

typedef struct ouroboros_stack* ouroboros_stack_t;

void ouroboros_stack_init(pTHX_ ouroboros_stack_t stack);
void ouroboros_stack_prepush(pTHX_ ouroboros_stack_t stack);
void ouroboros_stack_putback(pTHX_ ouroboros_stack_t stack);

SV* ouroboros_stack_fetch(pTHX_ ouroboros_stack_t stack, unsigned int item);
void ouroboros_stack_store(pTHX_ ouroboros_stack_t stack, unsigned int item, SV* value);

void ouroboros_stack_xpush_sv(pTHX_ ouroboros_stack_t stack, SV* value);
void ouroboros_stack_xpush_iv(pTHX_ ouroboros_stack_t stack, IV value);
void ouroboros_stack_xpush_uv(pTHX_ ouroboros_stack_t stack, UV value);
void ouroboros_stack_xpush_nv(pTHX_ ouroboros_stack_t stack, NV value);
void ouroboros_stack_xpush_pv(pTHX_ ouroboros_stack_t stack, char* str, size_t len);

IV ouroboros_sv_iv(pTHX_ SV *sv);
UV ouroboros_sv_uv(pTHX_ SV *sv);
NV ouroboros_sv_nv(pTHX_ SV *sv);
AV* ouroboros_sv_av(pTHX_ SV *sv);
HV* ouroboros_sv_hv(pTHX_ SV *sv);
int ouroboros_sv_rok(pTHX_ SV *sv);
svtype ouroboros_sv_type(pTHX_ SV *sv);

void ouroboros_call_sv(pTHX_ SV* sv, I32 flags);

#endif
