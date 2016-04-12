package Ouroboros::Spec;
use strict;
use warnings;

our $VERSION = "0.04";

# spec {
our %SPEC = (
  "const" => [
    {
      "name" => "SV_IMMEDIATE_UNREF"
    },
    {
      "name" => "SV_GMAGIC"
    },
    {
      "name" => "SV_COW_DROP_PV"
    },
    {
      "name" => "SV_UTF8_NO_ENCODING"
    },
    {
      "name" => "SV_NOSTEAL"
    },
    {
      "name" => "SV_CONST_RETURN"
    },
    {
      "name" => "SV_MUTABLE_RETURN"
    },
    {
      "name" => "SV_SMAGIC"
    },
    {
      "name" => "SV_HAS_TRAILING_NUL"
    },
    {
      "name" => "SV_COW_SHARED_HASH_KEYS"
    },
    {
      "name" => "SV_COW_OTHER_PVS"
    },
    {
      "name" => "SV_UNDEF_RETURNS_NULL"
    },
    {
      "name" => "SV_FORCE_UTF8_UPGRADE"
    },
    {
      "name" => "SV_SKIP_OVERLOAD"
    },
    {
      "name" => "SV_CATBYTES"
    },
    {
      "name" => "SV_CATUTF8"
    },
    {
      "name" => "SV_CONST_TIESCALAR"
    },
    {
      "name" => "SV_CONST_TIEARRAY"
    },
    {
      "name" => "SV_CONST_TIEHASH"
    },
    {
      "name" => "SV_CONST_TIEHANDLE"
    },
    {
      "name" => "SV_CONST_FETCH"
    },
    {
      "name" => "SV_CONST_FETCHSIZE"
    },
    {
      "name" => "SV_CONST_STORE"
    },
    {
      "name" => "SV_CONST_STORESIZE"
    },
    {
      "name" => "SV_CONST_EXISTS"
    },
    {
      "name" => "SV_CONST_PUSH"
    },
    {
      "name" => "SV_CONST_POP"
    },
    {
      "name" => "SV_CONST_SHIFT"
    },
    {
      "name" => "SV_CONST_UNSHIFT"
    },
    {
      "name" => "SV_CONST_SPLICE"
    },
    {
      "name" => "SV_CONST_EXTEND"
    },
    {
      "name" => "SV_CONST_FIRSTKEY"
    },
    {
      "name" => "SV_CONST_NEXTKEY"
    },
    {
      "name" => "SV_CONST_SCALAR"
    },
    {
      "name" => "SV_CONST_OPEN"
    },
    {
      "name" => "SV_CONST_WRITE"
    },
    {
      "name" => "SV_CONST_PRINT"
    },
    {
      "name" => "SV_CONST_PRINTF"
    },
    {
      "name" => "SV_CONST_READ"
    },
    {
      "name" => "SV_CONST_READLINE"
    },
    {
      "name" => "SV_CONST_GETC"
    },
    {
      "name" => "SV_CONST_SEEK"
    },
    {
      "name" => "SV_CONST_TELL"
    },
    {
      "name" => "SV_CONST_EOF"
    },
    {
      "name" => "SV_CONST_BINMODE"
    },
    {
      "name" => "SV_CONST_FILENO"
    },
    {
      "name" => "SV_CONST_CLOSE"
    },
    {
      "name" => "SV_CONST_DELETE"
    },
    {
      "name" => "SV_CONST_CLEAR"
    },
    {
      "name" => "SV_CONST_UNTIE"
    },
    {
      "name" => "SV_CONST_DESTROY"
    }
  ],
  "enum" => [
    {
      "name" => "SVt_NULL"
    },
    {
      "name" => "SVt_IV"
    },
    {
      "name" => "SVt_NV"
    },
    {
      "name" => "SVt_PV"
    },
    {
      "name" => "SVt_PVIV"
    },
    {
      "name" => "SVt_PVNV"
    },
    {
      "name" => "SVt_PVMG"
    },
    {
      "name" => "SVt_REGEXP"
    },
    {
      "name" => "SVt_PVGV"
    },
    {
      "name" => "SVt_PVLV"
    },
    {
      "name" => "SVt_PVAV"
    },
    {
      "name" => "SVt_PVHV"
    },
    {
      "name" => "SVt_PVCV"
    },
    {
      "name" => "SVt_PVFM"
    },
    {
      "name" => "SVt_PVIO"
    },
    {
      "name" => "SVt_LAST"
    }
  ],
  "fn" => [
    {
      "c_decl" => "void ouroboros_stack_init(pTHX_ ouroboros_stack_t*);",
      "name" => "ouroboros_stack_init",
      "params" => [
        "ouroboros_stack_t*"
      ],
      "ptr_name" => "ouroboros_stack_init_ptr",
      "tags" => {
        "apidoc" => "Initialize ouroboros_stack_t object. Must be first thing called by a XS-sub. Equivalent to C<dXSARGS> macro automatically inserted by C<xsubpp> into every XS sub."
      },
      "type" => "void"
    },
    {
      "c_decl" => "int ouroboros_stack_items(pTHX_ ouroboros_stack_t*);",
      "name" => "ouroboros_stack_items",
      "params" => [
        "ouroboros_stack_t*"
      ],
      "ptr_name" => "ouroboros_stack_items_ptr",
      "tags" => {
        "apidoc" => "Returns number of arguments on Perl stack. Equivalent to C<items> local variable in XS."
      },
      "type" => "int"
    },
    {
      "c_decl" => "void ouroboros_stack_prepush(pTHX_ ouroboros_stack_t*);",
      "name" => "ouroboros_stack_prepush",
      "params" => [
        "ouroboros_stack_t*"
      ],
      "ptr_name" => "ouroboros_stack_prepush_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_putback(pTHX_ ouroboros_stack_t*);",
      "name" => "ouroboros_stack_putback",
      "params" => [
        "ouroboros_stack_t*"
      ],
      "ptr_name" => "ouroboros_stack_putback_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "SV* ouroboros_stack_fetch(pTHX_ ouroboros_stack_t*, SSize_t);",
      "name" => "ouroboros_stack_fetch",
      "params" => [
        "ouroboros_stack_t*",
        "SSize_t"
      ],
      "ptr_name" => "ouroboros_stack_fetch_ptr",
      "tags" => {
        "apidoc" => "Read a value from the stack. Equivalent of:\n\n    return ST(a);\n\nPerl macro: C<ST(n)>"
      },
      "type" => "SV*"
    },
    {
      "c_decl" => "void ouroboros_stack_store(pTHX_ ouroboros_stack_t*, SSize_t, SV*);",
      "name" => "ouroboros_stack_store",
      "params" => [
        "ouroboros_stack_t*",
        "SSize_t",
        "SV*"
      ],
      "ptr_name" => "ouroboros_stack_store_ptr",
      "tags" => {
        "apidoc" => "Store a value on the stack. Equivalent of:\n\n    ST(a) = sv;\n\nPerl macro: C<ST>"
      },
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_extend(pTHX_ ouroboros_stack_t*, SSize_t);",
      "name" => "ouroboros_stack_extend",
      "params" => [
        "ouroboros_stack_t*",
        "SSize_t"
      ],
      "ptr_name" => "ouroboros_stack_extend_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_pushmark(pTHX_ ouroboros_stack_t*);",
      "name" => "ouroboros_stack_pushmark",
      "params" => [
        "ouroboros_stack_t*"
      ],
      "ptr_name" => "ouroboros_stack_pushmark_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_spagain(pTHX_ ouroboros_stack_t*);",
      "name" => "ouroboros_stack_spagain",
      "params" => [
        "ouroboros_stack_t*"
      ],
      "ptr_name" => "ouroboros_stack_spagain_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_xpush_sv(pTHX_ ouroboros_stack_t*, SV*);",
      "name" => "ouroboros_stack_xpush_sv",
      "params" => [
        "ouroboros_stack_t*",
        "SV*"
      ],
      "ptr_name" => "ouroboros_stack_xpush_sv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_xpush_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);",
      "name" => "ouroboros_stack_xpush_sv_mortal",
      "params" => [
        "ouroboros_stack_t*",
        "SV*"
      ],
      "ptr_name" => "ouroboros_stack_xpush_sv_mortal_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_xpush_iv(pTHX_ ouroboros_stack_t*, IV);",
      "name" => "ouroboros_stack_xpush_iv",
      "params" => [
        "ouroboros_stack_t*",
        "IV"
      ],
      "ptr_name" => "ouroboros_stack_xpush_iv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_xpush_uv(pTHX_ ouroboros_stack_t*, UV);",
      "name" => "ouroboros_stack_xpush_uv",
      "params" => [
        "ouroboros_stack_t*",
        "UV"
      ],
      "ptr_name" => "ouroboros_stack_xpush_uv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_xpush_nv(pTHX_ ouroboros_stack_t*, NV);",
      "name" => "ouroboros_stack_xpush_nv",
      "params" => [
        "ouroboros_stack_t*",
        "NV"
      ],
      "ptr_name" => "ouroboros_stack_xpush_nv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_xpush_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);",
      "name" => "ouroboros_stack_xpush_pv",
      "params" => [
        "ouroboros_stack_t*",
        "const char*",
        "STRLEN"
      ],
      "ptr_name" => "ouroboros_stack_xpush_pv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_push_sv(pTHX_ ouroboros_stack_t*, SV*);",
      "name" => "ouroboros_stack_push_sv",
      "params" => [
        "ouroboros_stack_t*",
        "SV*"
      ],
      "ptr_name" => "ouroboros_stack_push_sv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_push_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);",
      "name" => "ouroboros_stack_push_sv_mortal",
      "params" => [
        "ouroboros_stack_t*",
        "SV*"
      ],
      "ptr_name" => "ouroboros_stack_push_sv_mortal_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_push_iv(pTHX_ ouroboros_stack_t*, IV);",
      "name" => "ouroboros_stack_push_iv",
      "params" => [
        "ouroboros_stack_t*",
        "IV"
      ],
      "ptr_name" => "ouroboros_stack_push_iv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_push_uv(pTHX_ ouroboros_stack_t*, UV);",
      "name" => "ouroboros_stack_push_uv",
      "params" => [
        "ouroboros_stack_t*",
        "UV"
      ],
      "ptr_name" => "ouroboros_stack_push_uv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_push_nv(pTHX_ ouroboros_stack_t*, NV);",
      "name" => "ouroboros_stack_push_nv",
      "params" => [
        "ouroboros_stack_t*",
        "NV"
      ],
      "ptr_name" => "ouroboros_stack_push_nv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_stack_push_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);",
      "name" => "ouroboros_stack_push_pv",
      "params" => [
        "ouroboros_stack_t*",
        "const char*",
        "STRLEN"
      ],
      "ptr_name" => "ouroboros_stack_push_pv_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "IV ouroboros_sv_iv(pTHX_ SV*);",
      "name" => "ouroboros_sv_iv",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_iv_ptr",
      "tags" => {},
      "type" => "IV"
    },
    {
      "c_decl" => "UV ouroboros_sv_uv(pTHX_ SV*);",
      "name" => "ouroboros_sv_uv",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_uv_ptr",
      "tags" => {},
      "type" => "UV"
    },
    {
      "c_decl" => "NV ouroboros_sv_nv(pTHX_ SV*);",
      "name" => "ouroboros_sv_nv",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_nv_ptr",
      "tags" => {},
      "type" => "NV"
    },
    {
      "c_decl" => "const char* ouroboros_sv_pv(pTHX_ SV*, STRLEN*);",
      "name" => "ouroboros_sv_pv",
      "params" => [
        "SV*",
        "STRLEN*"
      ],
      "ptr_name" => "ouroboros_sv_pv_ptr",
      "tags" => {},
      "type" => "const char*"
    },
    {
      "c_decl" => "const char* ouroboros_sv_pv_nolen(pTHX_ SV*);",
      "name" => "ouroboros_sv_pv_nolen",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_pv_nolen_ptr",
      "tags" => {},
      "type" => "const char*"
    },
    {
      "c_decl" => "U32 ouroboros_sv_rok(pTHX_ SV*);",
      "name" => "ouroboros_sv_rok",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_rok_ptr",
      "tags" => {},
      "type" => "U32"
    },
    {
      "c_decl" => "SV* ouroboros_sv_rv(pTHX_ SV*);",
      "name" => "ouroboros_sv_rv",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_rv_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "IV ouroboros_sv_type(pTHX_ SV*);",
      "name" => "ouroboros_sv_type",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_type_ptr",
      "tags" => {},
      "type" => "IV"
    },
    {
      "c_decl" => "SV* ouroboros_gv_sv(pTHX_ GV*);",
      "name" => "ouroboros_gv_sv",
      "params" => [
        "GV*"
      ],
      "ptr_name" => "ouroboros_gv_sv_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "AV* ouroboros_gv_av(pTHX_ GV*);",
      "name" => "ouroboros_gv_av",
      "params" => [
        "GV*"
      ],
      "ptr_name" => "ouroboros_gv_av_ptr",
      "tags" => {},
      "type" => "AV*"
    },
    {
      "c_decl" => "HV* ouroboros_gv_hv(pTHX_ GV*);",
      "name" => "ouroboros_gv_hv",
      "params" => [
        "GV*"
      ],
      "ptr_name" => "ouroboros_gv_hv_ptr",
      "tags" => {},
      "type" => "HV*"
    },
    {
      "c_decl" => "CV* ouroboros_gv_cv(pTHX_ CV*);",
      "name" => "ouroboros_gv_cv",
      "params" => [
        "CV*"
      ],
      "ptr_name" => "ouroboros_gv_cv_ptr",
      "tags" => {},
      "type" => "CV*"
    },
    {
      "c_decl" => "const char* ouroboros_he_pv(pTHX_ HE*, STRLEN*);",
      "name" => "ouroboros_he_pv",
      "params" => [
        "HE*",
        "STRLEN*"
      ],
      "ptr_name" => "ouroboros_he_pv_ptr",
      "tags" => {},
      "type" => "const char*"
    },
    {
      "c_decl" => "SV* ouroboros_he_val(pTHX_ HE*);",
      "name" => "ouroboros_he_val",
      "params" => [
        "HE*"
      ],
      "ptr_name" => "ouroboros_he_val_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "U32 ouroboros_he_hash(pTHX_ HE*);",
      "name" => "ouroboros_he_hash",
      "params" => [
        "HE*"
      ],
      "ptr_name" => "ouroboros_he_hash_ptr",
      "tags" => {},
      "type" => "U32"
    },
    {
      "c_decl" => "SV* ouroboros_he_svkey(pTHX_ HE*);",
      "name" => "ouroboros_he_svkey",
      "params" => [
        "HE*"
      ],
      "ptr_name" => "ouroboros_he_svkey_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "SV* ouroboros_he_svkey_force(pTHX_ HE*);",
      "name" => "ouroboros_he_svkey_force",
      "params" => [
        "HE*"
      ],
      "ptr_name" => "ouroboros_he_svkey_force_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "SV* ouroboros_he_svkey_set(pTHX_ HE*, SV*);",
      "name" => "ouroboros_he_svkey_set",
      "params" => [
        "HE*",
        "SV*"
      ],
      "ptr_name" => "ouroboros_he_svkey_set_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "U32 ouroboros_perl_hash(pTHX_ U8*, STRLEN);",
      "name" => "ouroboros_perl_hash",
      "params" => [
        "U8*",
        "STRLEN"
      ],
      "ptr_name" => "ouroboros_perl_hash_ptr",
      "tags" => {
        "apidoc" => "Unlike macro, returns hash value instead of assigning it to argument.\n\nPerl macro: C<PERL_HASH>"
      },
      "type" => "U32"
    },
    {
      "c_decl" => "U32 ouroboros_sv_refcnt(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_ptr",
      "tags" => {},
      "type" => "U32"
    },
    {
      "c_decl" => "SV* ouroboros_sv_refcnt_inc(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt_inc",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_inc_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "SV* ouroboros_sv_refcnt_inc_nn(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt_inc_nn",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_inc_nn_ptr",
      "tags" => {},
      "type" => "SV*"
    },
    {
      "c_decl" => "void ouroboros_sv_refcnt_inc_void(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt_inc_void",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_inc_void_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_sv_refcnt_inc_void_nn(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt_inc_void_nn",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_inc_void_nn_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_sv_refcnt_dec(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt_dec",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_dec_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_sv_refcnt_dec_nn(pTHX_ SV*);",
      "name" => "ouroboros_sv_refcnt_dec_nn",
      "params" => [
        "SV*"
      ],
      "ptr_name" => "ouroboros_sv_refcnt_dec_nn_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_enter(pTHX);",
      "name" => "ouroboros_enter",
      "params" => [],
      "ptr_name" => "ouroboros_enter_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_leave(pTHX);",
      "name" => "ouroboros_leave",
      "params" => [],
      "ptr_name" => "ouroboros_leave_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_savetmps(pTHX);",
      "name" => "ouroboros_savetmps",
      "params" => [],
      "ptr_name" => "ouroboros_savetmps_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_freetmps(pTHX);",
      "name" => "ouroboros_freetmps",
      "params" => [],
      "ptr_name" => "ouroboros_freetmps_ptr",
      "tags" => {},
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_sys_init3(int*, char***, char***);",
      "name" => "ouroboros_sys_init3",
      "params" => [
        "int*",
        "char***",
        "char***"
      ],
      "ptr_name" => "ouroboros_sys_init3_ptr",
      "tags" => {
        "no_pthx" => 1
      },
      "type" => "void"
    },
    {
      "c_decl" => "void ouroboros_sys_term();",
      "name" => "ouroboros_sys_term",
      "params" => [],
      "ptr_name" => "ouroboros_sys_term_ptr",
      "tags" => {
        "no_pthx" => 1
      },
      "type" => "void"
    },
    {
      "c_decl" => "int ouroboros_xcpt_try(pTHX_ ouroboros_xcpt_callback_t, void*);",
      "name" => "ouroboros_xcpt_try",
      "params" => [
        "ouroboros_xcpt_callback_t",
        "void*"
      ],
      "ptr_name" => "ouroboros_xcpt_try_ptr",
      "tags" => {
        "apidoc" => "Execute callback once while capturing Perl exceptions. Second argument is passed to the callback as is and can be NULL.\n\nThis is equivalent of C<XCPT_TRY_START> and C<XCPT_TRY_END> macros, see L<perlguts/Exception Handling>.\n\nReturns zero if callback was executed successfully and no Perl exceptions were thrown.\n\nReturns non-zero if Perl exception was thrown while executing callback. After doing cleanups, this value must be passed to L</ouroboros_xcpt_rethrow>.\n\nPerl macro: C<XCPT_TRY_START> and C<XCPT_TRY_END>"
      },
      "type" => "int"
    },
    {
      "c_decl" => "void ouroboros_xcpt_rethrow(pTHX_ int);",
      "name" => "ouroboros_xcpt_rethrow",
      "params" => [
        "int"
      ],
      "ptr_name" => "ouroboros_xcpt_rethrow_ptr",
      "tags" => {
        "apidoc" => "Continue exception unwinding after unsuccessful call to L</ouroboros_xcpt_try>.\n\nPerl macro: C<XCPT_RETHROW>"
      },
      "type" => "void"
    }
  ],
  "sizeof" => [
    {
      "type" => "bool"
    },
    {
      "type" => "svtype"
    },
    {
      "type" => "PADOFFSET"
    },
    {
      "type" => "Optype"
    },
    {
      "type" => "ouroboros_stack_t"
    }
  ]
);

# }

1;
__END__

=head1 NAME

Ouroboros::Spec - Ouroboros API specification

=head1 DESCRIPTION

This package contains a single global variable, C<%SPEC> that describes API
provided by the L<Ouroboros> package. Each key in this hash corresponds to a
certain item type described below, and values are all arrayrefs of hashrefs.

=head1 CONTENTS

=head2 Constants

    $SPEC{const} = [ { name => "..." }, ... ];

A list of supported numeric constants.

=head3 Keys

=over

=item name

Constant name.

=back

=head2 Enum values

    $SPEC{enum} = [ { name => "..." }, ... ];

A list of supported enum values. This is a separate list due to nuance of
C<ExtUtils::Constant> implementation.

=head3 Keys

=over

=item name

Enum value name.

=back

=head2 Functions

    $SPEC{fn} = [ { name => "...", ... }, ... ];

=head3 Keys

=over

=item name

Name of the C function.

=item ptr_name

Name of the pointer getter in L<Ouroboros> package.

=item c_decl

C header declaration.

=item type

Return type of the function.

=item params

Arrayref containing C types of each of function argument, excluding C<pTHX>
argument present by default (but see C<no_pthx> tag below).

=item tags

Additional metadata about the function.

=over

=item apidoc

POD string containing additional notes about the item.

=item no_pthx

When true, indicates that function does not have pTHX as a first argument.

=back

=back

=head2 Type sizes

    $SPEC{sizeof} => [ { type => "..." }, ... ];

A list of types available via %SIZE_OF hash in L<Ouroboros> package.

=head3 Keys

=over

=item type

Name of the C type.

=back
