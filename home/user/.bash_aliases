##########################################################################
##	Alejandro Colomar Andres					##
##########################################################################

##########################################################################
##	Exit status
EX_OK=0;

EX_USAGE=64;

##########################################################################
##	Printer
alias lp2s='lp -o sides=two-sided-long-edge -o collate=true';

##########################################################################
##	Linux kernel
function grep_syscall()
{
	if ! [ -v 1 ]; then
		>&2 echo "Usage: ${FUNCNAME[0]} <syscall>";
		return ${EX_USAGE};
	fi

	find * -type f \
	|grep '\.c$' \
	|xargs pcregrep -Mn "(?s)^[\w_]*SYSCALL_DEFINE.\(${1},.*?\)" \
	|sed 's/^[^:]*:[0-9]*:/&\n/';

	find * -type f \
	|grep '\.h$' \
	|xargs pcregrep -Mn "(?s)^asmlinkage [\w_\d]* sys_${1}\(.*?\)" \
	|sed 's/^[^:]*:[0-9]*:/&\n/';
}

function grep_syscall_def()
{
	if ! [ -v 1 ]; then
		>&2 echo "Usage: ${FUNCNAME[0]} <syscall>";
		return ${EX_USAGE};
	fi

	find * -type f \
	|grep '\.c$' \
	|xargs pcregrep -Mn "(?s)^[\w_]*SYSCALL_DEFINE.\(${1},.*?^}" \
	|sed 's/^[^:]*:[0-9]*:/&\n/';
}

##########################################################################
##	Linux man-pages
function pdfman()
{
	if ! [ -v 1 ]; then
		>&2 echo "Usage: ${FUNCNAME[0]} <man-page.n>";
		return ${EX_USAGE};
	fi;

	man -Tps -l ${1} \
	|ps2pdf - - \
	|zathura -;
}

##########################################################################
##
function grep_syscall_wrapper()
{
	if ! [ -v 2 ]; then
		>&2 echo "Usage: ${FUNCNAME[0]} <return type> <syscall>";
		return ${EX_USAGE};
	fi

	find * -type f \
	|grep '\.h$' \
	|xargs pcregrep -Mn "(?s)^[\w\s]*${1}\s*${2}\s*\(.*?;" \
	|sed 's/^[^:]*:[0-9]*:/&\n/';
}

##########################################################################
##########################################################################
