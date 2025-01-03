#!/bin/sh
# vim: filetype=sh noexpandtab ts=8 sw=8
# $FreeBSD: head/tools/regression/pjdfstest/tests/mkfifo/12.t 211352 2010-08-15 21:24:17Z pjd $

desc="mkfifo returns EFAULT if the path argument points outside the process's allocated address space"

dir=`dirname $0`
. ${dir}/../misc.sh

require ftype_fifo

echo "1..2"

expect EFAULT mkfifo NULL 0644
expect EFAULT mkfifo DEADCODE 0644
