#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/symlink/01.t 211352 2010-08-15 21:24:17Z pjd $

desc="symlink returns ENOTDIR if a component of the name2 path prefix is not a directory"

dir=`dirname $0`
. ${dir}/../misc.sh

require ftype_symlink

echo "1..5"

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755
expect 0 create ${n0}/${n1} 0644
expect ENOTDIR symlink test ${n0}/${n1}/test
expect 0 unlink ${n0}/${n1}
expect 0 rmdir ${n0}
