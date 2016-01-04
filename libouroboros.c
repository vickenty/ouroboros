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

SV* ouroboros_stack_fetch(pTHX_ ouroboros_stack_t stack, SSize_t item)
{
        return ST(item);
}

void ouroboros_stack_store(pTHX_ ouroboros_stack_t stack, SSize_t item, SV* value)
{
        ST(item) = value;
}

void ouroboros_stack_pushmark(pTHX_ ouroboros_stack_t stack)
{
	PUSHMARK(SP);
}

void ouroboros_stack_extend(pTHX_ ouroboros_stack_t stack, SSize_t size)
{
	EXTEND(SP, size);
}

/* functions { */
void ouroboros_stack_prepush(pTHX_ ouroboros_stack_t stack)
{
        XSprePUSH;
}

void ouroboros_stack_putback(pTHX_ ouroboros_stack_t stack)
{
        PUTBACK;
}

void ouroboros_stack_xpush_sv(pTHX_ ouroboros_stack_t stack, SV* sv)
{
        XPUSHs(sv);
}

void ouroboros_stack_xpush_sv_mortal(pTHX_ ouroboros_stack_t stack, SV* sv)
{
        mXPUSHs(sv);
}

void ouroboros_stack_xpush_iv(pTHX_ ouroboros_stack_t stack, IV a)
{
        mXPUSHi(a);
}

void ouroboros_stack_xpush_uv(pTHX_ ouroboros_stack_t stack, UV a)
{
        mXPUSHu(a);
}

void ouroboros_stack_xpush_nv(pTHX_ ouroboros_stack_t stack, NV a)
{
        mXPUSHn(a);
}

void ouroboros_stack_xpush_pv(pTHX_ ouroboros_stack_t stack, const char* a, STRLEN b)
{
        mXPUSHp(a, b);
}

IV ouroboros_sv_iv(pTHX_ SV* sv)
{
        return SvIV(sv);
}

UV ouroboros_sv_uv(pTHX_ SV* sv)
{
        return SvUV(sv);
}

NV ouroboros_sv_nv(pTHX_ SV* sv)
{
        return SvNV(sv);
}

U32 ouroboros_sv_rok(pTHX_ SV* sv)
{
        return SvROK(sv);
}

SV* ouroboros_sv_rv(pTHX_ SV* sv)
{
        return SvRV(sv);
}

IV ouroboros_sv_type(pTHX_ SV* sv)
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

void ouroboros_enter(pTHX)
{
        ENTER;
}

void ouroboros_leave(pTHX)
{
        LEAVE;
}

void ouroboros_savetmps(pTHX)
{
        SAVETMPS;
}

void ouroboros_freetmps(pTHX)
{
        FREETMPS;
}
/* } */
