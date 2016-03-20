void*
ouroboros_stack_init_ptr()
CODE:
	RETVAL = ouroboros_stack_init;
OUTPUT:
	RETVAL

void*
ouroboros_stack_items_ptr()
CODE:
	RETVAL = ouroboros_stack_items;
OUTPUT:
	RETVAL

void*
ouroboros_stack_prepush_ptr()
CODE:
	RETVAL = ouroboros_stack_prepush;
OUTPUT:
	RETVAL

void*
ouroboros_stack_putback_ptr()
CODE:
	RETVAL = ouroboros_stack_putback;
OUTPUT:
	RETVAL

void*
ouroboros_stack_fetch_ptr()
CODE:
	RETVAL = ouroboros_stack_fetch;
OUTPUT:
	RETVAL

void*
ouroboros_stack_store_ptr()
CODE:
	RETVAL = ouroboros_stack_store;
OUTPUT:
	RETVAL

void*
ouroboros_stack_extend_ptr()
CODE:
	RETVAL = ouroboros_stack_extend;
OUTPUT:
	RETVAL

void*
ouroboros_stack_pushmark_ptr()
CODE:
	RETVAL = ouroboros_stack_pushmark;
OUTPUT:
	RETVAL

void*
ouroboros_stack_spagain_ptr()
CODE:
	RETVAL = ouroboros_stack_spagain;
OUTPUT:
	RETVAL

void*
ouroboros_stack_xpush_sv_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_sv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_xpush_sv_mortal_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_sv_mortal;
OUTPUT:
	RETVAL

void*
ouroboros_stack_xpush_iv_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_iv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_xpush_uv_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_uv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_xpush_nv_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_nv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_xpush_pv_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_pv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_push_sv_ptr()
CODE:
	RETVAL = ouroboros_stack_push_sv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_push_sv_mortal_ptr()
CODE:
	RETVAL = ouroboros_stack_push_sv_mortal;
OUTPUT:
	RETVAL

void*
ouroboros_stack_push_iv_ptr()
CODE:
	RETVAL = ouroboros_stack_push_iv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_push_uv_ptr()
CODE:
	RETVAL = ouroboros_stack_push_uv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_push_nv_ptr()
CODE:
	RETVAL = ouroboros_stack_push_nv;
OUTPUT:
	RETVAL

void*
ouroboros_stack_push_pv_ptr()
CODE:
	RETVAL = ouroboros_stack_push_pv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_iv_ptr()
CODE:
	RETVAL = ouroboros_sv_iv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_uv_ptr()
CODE:
	RETVAL = ouroboros_sv_uv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_nv_ptr()
CODE:
	RETVAL = ouroboros_sv_nv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_pv_ptr()
CODE:
	RETVAL = ouroboros_sv_pv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_pv_nolen_ptr()
CODE:
	RETVAL = ouroboros_sv_pv_nolen;
OUTPUT:
	RETVAL

void*
ouroboros_sv_rok_ptr()
CODE:
	RETVAL = ouroboros_sv_rok;
OUTPUT:
	RETVAL

void*
ouroboros_sv_rv_ptr()
CODE:
	RETVAL = ouroboros_sv_rv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_type_ptr()
CODE:
	RETVAL = ouroboros_sv_type;
OUTPUT:
	RETVAL

void*
ouroboros_gv_sv_ptr()
CODE:
	RETVAL = ouroboros_gv_sv;
OUTPUT:
	RETVAL

void*
ouroboros_gv_av_ptr()
CODE:
	RETVAL = ouroboros_gv_av;
OUTPUT:
	RETVAL

void*
ouroboros_gv_hv_ptr()
CODE:
	RETVAL = ouroboros_gv_hv;
OUTPUT:
	RETVAL

void*
ouroboros_gv_cv_ptr()
CODE:
	RETVAL = ouroboros_gv_cv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_inc_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt_inc;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_inc_nn_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt_inc_nn;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_inc_void_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt_inc_void;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_inc_void_nn_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt_inc_void_nn;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_dec_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt_dec;
OUTPUT:
	RETVAL

void*
ouroboros_sv_refcnt_dec_nn_ptr()
CODE:
	RETVAL = ouroboros_sv_refcnt_dec_nn;
OUTPUT:
	RETVAL

void*
ouroboros_enter_ptr()
CODE:
	RETVAL = ouroboros_enter;
OUTPUT:
	RETVAL

void*
ouroboros_leave_ptr()
CODE:
	RETVAL = ouroboros_leave;
OUTPUT:
	RETVAL

void*
ouroboros_savetmps_ptr()
CODE:
	RETVAL = ouroboros_savetmps;
OUTPUT:
	RETVAL

void*
ouroboros_freetmps_ptr()
CODE:
	RETVAL = ouroboros_freetmps;
OUTPUT:
	RETVAL

void*
ouroboros_sys_init3_ptr()
CODE:
	RETVAL = ouroboros_sys_init3;
OUTPUT:
	RETVAL

void*
ouroboros_sys_term_ptr()
CODE:
	RETVAL = ouroboros_sys_term;
OUTPUT:
	RETVAL

