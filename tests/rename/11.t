#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/rename/11.t 211352 2010-08-15 21:24:17Z pjd $

desc="rename returns ELOOP if too many symbolic links were encountered in translating one of the pathnames"

dir=`dirname $0`
. ${dir}/../misc.sh

require ftype_symlink

echo "1..10"

n0=`namegen`
n1=`namegen`
n2=`namegen`

expect 0 symlink ${n0} ${n1}
expect 0 symlink ${n1} ${n0}
expect ELOOP rename ${n0}/test ${n2}
expect ELOOP rename ${n1}/test ${n2}
expect 0 create ${n2} 0644
expect ELOOP rename ${n2} ${n0}/test
expect ELOOP rename ${n2} ${n1}/test
expect 0 unlink ${n0}
expect 0 unlink ${n1}
expect 0 unlink ${n2}
