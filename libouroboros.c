#include "libouroboros.h"

void ouroboros_stack_init(pTHX_ ouroboros_stack_t stack)
{
        dXSARGS;
        stack->sp = sp;
        stack->mark = mark;
        stack->ax = ax;
        stack->items = items;
}

#define sp (stack->sp)
#define mark (stack->mark)
#define ax (stack->ax)
#define items (stack->items)

SV* ouroboros_stack_fetch(pTHX_ ouroboros_stack_t stack, unsigned int item)
{
        return ST(item);
}

void ouroboros_stack_store(pTHX_ ouroboros_stack_t stack, unsigned int item, SV* value)
{
        ST(item) = value;
}

void ouroboros_stack_prepush(pTHX_ ouroboros_stack_t stack)
{
        XSprePUSH;
}

#define WRAP(op, suffix, type)                                          \
        void ouroboros_stack_xpush_##suffix (                           \
                pTHX_                                                   \
                ouroboros_stack_t stack,                                \
                type value)                                             \
        {                                                               \
                op(value);                                              \
        }

WRAP(XPUSHs, sv, SV*);
WRAP(mXPUSHs, sv_mortal, SV*);
WRAP(mXPUSHi, iv, IV);
WRAP(mXPUSHu, uv, UV);
WRAP(mXPUSHn, nv, NV);

#undef WRAP

void ouroboros_stack_xpush_pv(pTHX_ ouroboros_stack_t stack, char *s, size_t len)
{
	mXPUSHp(s, len);
}

void ouroboros_stack_putback(pTHX_ ouroboros_stack_t stack)
{
        PUTBACK;
}

IV ouroboros_sv_iv(pTHX_ SV *sv)
{
        return SvIV(sv);
}

UV ouroboros_sv_uv(pTHX_ SV *sv)
{
        return SvUV(sv);
}

NV ouroboros_sv_nv(pTHX_ SV *sv)
{
	return SvNV(sv);
}

AV* ouroboros_sv_av(pTHX_ SV *sv)
{
	return (AV*) SvRV(sv);
}

HV* ouroboros_sv_hv(pTHX_ SV *sv)
{
	return (HV*) SvRV(sv);
}

U32 ouroboros_sv_rok(pTHX_ SV *sv)
{
	return SvROK(sv);
}

SV* ouroboros_sv_rv(pTHX_ SV *sv)
{
	return SvRV(sv);
}

IV ouroboros_sv_type(pTHX_ SV *sv)
{
	return SvTYPE(sv);
}

U32 ouroboros_sv_refcnt(pTHX_ SV* sv)
{
        return SvREFCNT(sv);
}

SV* ouroboros_sv_refcnt_inc(pTHX_ SV* sv)
{
        return SvREFCNT_inc_simple(sv);
}

SV* ouroboros_sv_refcnt_inc_nn(pTHX_ SV* sv)
{
        return SvREFCNT_inc_simple_NN(sv);
}

void ouroboros_sv_refcnt_inc_void(pTHX_ SV* sv)
{
        SvREFCNT_inc_simple_void(sv);
}

void ouroboros_sv_refcnt_inc_void_nn(pTHX_ SV* sv)
{
        SvREFCNT_inc_simple_void_NN(sv);
}

void ouroboros_sv_refcnt_dec(pTHX_ SV* sv)
{
        SvREFCNT_dec(sv);
}

void ouroboros_sv_refcnt_dec_nn(pTHX_ SV* sv)
{
        SvREFCNT_dec_NN(sv);
}
