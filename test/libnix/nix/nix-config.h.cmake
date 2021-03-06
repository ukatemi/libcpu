#ifndef __nix_config_h
#define __nix_config_h

#cmakedefine HAVE_SYS_PARAM_H 1
#cmakedefine HAVE_SYS_EVENT_H 1
#cmakedefine HAVE_SYS_FILIO_H 1
#cmakedefine HAVE_SYS_MKDEV_H 1
#cmakedefine HAVE_SYS_MNTTAB_H 1
#cmakedefine HAVE_SYS_MOUNT_H 1
#cmakedefine HAVE_SYS_VFS_H 1
#cmakedefine HAVE_SYS_STATVFS_H 1
#cmakedefine HAVE_BITSTRING_H 1
#cmakedefine HAVE_SCHED_H 1
#cmakedefine HAVE_PTHREAD_H 1
#cmakedefine HAVE_UCRED_H 1

#cmakedefine HAVE_ACCT 1
#cmakedefine HAVE_ADJFREQ 1
#cmakedefine HAVE_ADJTIME 1
#cmakedefine HAVE_CLOCK_GETRES 1
#cmakedefine HAVE_CLOCK_GETTIME 1
#cmakedefine HAVE_CLOCK_SETTIME 1
#cmakedefine HAVE_FDATASYNC 1
#cmakedefine HAVE_GETHOSTID 1
#cmakedefine HAVE_ISSETUGID 1
#cmakedefine HAVE_KQUEUE 1
#cmakedefine HAVE_NICE 1
#cmakedefine HAVE_PTHREAD_YIELD 1
#cmakedefine HAVE_REVOKE 1
#cmakedefine HAVE_SCHED_YIELD 1
#cmakedefine HAVE_SETFSGID 1
#cmakedefine HAVE_SETFSUID 1
#cmakedefine HAVE_SETHOSTID 1

#if !defined(__NetBSD__)
#cmakedefine HAVE_GETFSSTAT 1
#endif

/*
 * For Solaris hide statfs/fstatfs.
 */
#if !defined(sun)&&!defined(__NetBSD__)
#cmakedefine HAVE_STATFS 1
#cmakedefine HAVE_FSTATFS 1
#endif

#cmakedefine HAVE_STATVFS 1
#cmakedefine HAVE_FSTATVFS 1

#cmakedefine HAVE_RESETMNTTAB 1
#cmakedefine HAVE_GETMNTENT 1
#cmakedefine HAVE_GETEXTMNTENT 1

#cmakedefine HAVE_SETLOGIN 1

#cmakedefine HAVE_FUTIMES 1
#cmakedefine HAVE_FUTIMESAT 1
#cmakedefine HAVE_FLOCK 1
#cmakedefine HAVE_LOCKF 1

#cmakedefine HAVE_GETPEEREID 1
#cmakedefine HAVE_GETPEERUCRED 1

/*
 * For Linux: define conformance mode
 */
#cmakedefine HAVE_FEATURES_H
#if defined(HAVE_FEATURES_H)
#define _XOPEN_SOURCE 500
#define _BSD_SOURCE
#include <features.h>

#endif /* HAVE_FEATURES_H */

/*
 * For glibc: hide some functions
 *
 * Reasons:
 * - glibc exports the chflags and fchflags symbols, so the cmake
 *   feature tests for the functions succeed, but the functions are
 *   not declared in any public header, so the build fails.
 *
 * - glibc provides [gs]etres[ug]id (nonstandard hpux funcs), but only
 *   declares them if _GNU_SOURCE is defined. The feature test passes,
 *   but not the build. Since we don't care about these functions on
 *   !hpux, we hide them manually.
 */
#if !defined(__GLIBC__)
#cmakedefine HAVE_CHFLAGS 1
#cmakedefine HAVE_FCHFLAGS 1
#cmakedefine HAVE_GETRESGID 1
#cmakedefine HAVE_GETRESUID 1
#endif /* !__GLIBC__ */

#endif  /* !__nix_config_h */
