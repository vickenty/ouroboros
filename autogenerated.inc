void*
ouroboros_stack_init_ptr()
CODE:
	RETVAL = ouroboros_stack_init;
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
ouroboros_stack_xpush_sv_ptr()
CODE:
	RETVAL = ouroboros_stack_xpush_sv;
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
ouroboros_sv_av_ptr()
CODE:
	RETVAL = ouroboros_sv_av;
OUTPUT:
	RETVAL

void*
ouroboros_sv_hv_ptr()
CODE:
	RETVAL = ouroboros_sv_hv;
OUTPUT:
	RETVAL

void*
ouroboros_sv_rok_ptr()
CODE:
	RETVAL = ouroboros_sv_rok;
OUTPUT:
	RETVAL

void*
ouroboros_sv_type_ptr()
CODE:
	RETVAL = ouroboros_sv_type;
OUTPUT:
	RETVAL

void*
ouroboros_call_sv_ptr()
CODE:
	RETVAL = ouroboros_call_sv;
OUTPUT:
	RETVAL
