# unistd_h.m4 serial 90
dnl Copyright (C) 2006-2023 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl Written by Simon Josefsson, Bruno Haible.

AC_DEFUN_ONCE([gl_UNISTD_H],
[
  dnl Ensure to expand the default settings once only, before all statements
  dnl that occur in other macros.
  AC_REQUIRE([gl_UNISTD_H_DEFAULTS])

  gl_CHECK_NEXT_HEADERS([unistd.h])
  if test $ac_cv_header_unistd_h = yes; then
    HAVE_UNISTD_H=1
  else
    HAVE_UNISTD_H=0
  fi
  AC_SUBST([HAVE_UNISTD_H])

  dnl Ensure the type pid_t gets defined.
  AC_REQUIRE([AC_TYPE_PID_T])

  dnl Determine WINDOWS_64_BIT_OFF_T.
  AC_REQUIRE([gl_TYPE_OFF_T])

  dnl Check for declarations of anything we want to poison if the
  dnl corresponding gnulib module is not in use.
  gl_WARN_ON_USE_PREPARE([[
#if HAVE_UNISTD_H
# include <unistd.h>
#endif
/* Some systems declare various items in the wrong headers.  */
#if !(defined __GLIBC__ && !defined __UCLIBC__)
# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>
# if defined _WIN32 && ! defined __CYGWIN__
#  include <io.h>
# endif
#endif
    ]], [access chdir chown copy_file_range dup dup2 dup3 environ euidaccess
    execl execle execlp execv execve execvp execvpe
    faccessat fchdir
    fchownat fdatasync fsync ftruncate getcwd getdomainname getdtablesize
    getentropy getgroups gethostname getlogin getlogin_r getpagesize getpass
    getusershell setusershell endusershell
    group_member isatty lchown link linkat lseek pipe pipe2 pread pwrite
    readlink readlinkat rmdir sethostname sleep symlink symlinkat
    truncate ttyname_r unlink unlinkat usleep])
  gl_CHECK_FUNCS_ANDROID([ftruncate], [[#include <unistd.h>]])

  AC_REQUIRE([AC_C_RESTRICT])

  AC_CHECK_DECLS_ONCE([execvpe])
  if test $ac_cv_have_decl_execvpe = no; then
    HAVE_DECL_EXECVPE=0
  fi
])

# gl_UNISTD_MODULE_INDICATOR([modulename])
# sets the shell variable that indicates the presence of the given module
# to a C preprocessor expression that will evaluate to 1.
# This macro invocation must not occur in macros that are AC_REQUIREd.
AC_DEFUN([gl_UNISTD_MODULE_INDICATOR],
[
  dnl Ensure to expand the default settings once only.
  gl_UNISTD_H_REQUIRE_DEFAULTS
  gl_MODULE_INDICATOR_SET_VARIABLE([$1])
  dnl Define it also as a C macro, for the benefit of the unit tests.
  gl_MODULE_INDICATOR_FOR_TESTS([$1])
])

# Initializes the default values for AC_SUBSTed shell variables.
# This macro must not be AC_REQUIREd.  It must only be invoked, and only
# outside of macros or in macros that are not AC_REQUIREd.
AC_DEFUN([gl_UNISTD_H_REQUIRE_DEFAULTS],
[
  m4_defun(GL_MODULE_INDICATOR_PREFIX[_UNISTD_H_MODULE_INDICATOR_DEFAULTS], [
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_ACCESS])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_CHDIR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_CHOWN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_CLOSE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_COPY_FILE_RANGE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_DUP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_DUP2])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_DUP3])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_ENVIRON])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EUIDACCESS])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECL])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECLE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECLP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECV])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECVE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECVP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXECVPE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FACCESSAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FCHDIR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FCHOWNAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FDATASYNC])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FSYNC])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FTRUNCATE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETCWD])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETDOMAINNAME])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETDTABLESIZE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETENTROPY])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETGROUPS])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETHOSTNAME])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETLOGIN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETLOGIN_R])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETOPT_POSIX])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETPAGESIZE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETPASS])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETPASS_GNU])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GETUSERSHELL])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_GROUP_MEMBER])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_ISATTY])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_LCHOWN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_LINK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_LINKAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_LSEEK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_PIPE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_PIPE2])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_PREAD])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_PWRITE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_READ])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_READLINK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_READLINKAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_RMDIR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_SETHOSTNAME])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_SLEEP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_SYMLINK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_SYMLINKAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_TRUNCATE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_TTYNAME_R])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_UNISTD_H_GETOPT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_UNISTD_H_NONBLOCKING])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_UNISTD_H_SIGPIPE])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_UNLINK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_UNLINKAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_USLEEP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_WRITE])
    dnl Support Microsoft deprecated alias function names by default.
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_ACCESS], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_CHDIR], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_CLOSE], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_DUP], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_DUP2], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECL], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECLE], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECLP], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECV], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECVE], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECVP], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_EXECVPE], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_GETCWD], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_GETPID], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_ISATTY], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_LSEEK], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_READ], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_RMDIR], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_SWAB], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_UNLINK], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_WRITE], [1])
  ])
  m4_require(GL_MODULE_INDICATOR_PREFIX[_UNISTD_H_MODULE_INDICATOR_DEFAULTS])
  AC_REQUIRE([gl_UNISTD_H_DEFAULTS])
])

AC_DEFUN([gl_UNISTD_H_DEFAULTS],
[
  dnl Assume proper GNU behavior unless another module says otherwise.
  HAVE_CHOWN=1;                      AC_SUBST([HAVE_CHOWN])
  HAVE_COPY_FILE_RANGE=1;            AC_SUBST([HAVE_COPY_FILE_RANGE])
  HAVE_DUP3=1;                       AC_SUBST([HAVE_DUP3])
  HAVE_EUIDACCESS=1;                 AC_SUBST([HAVE_EUIDACCESS])
  HAVE_EXECVPE=1;                    AC_SUBST([HAVE_EXECVPE])
  HAVE_FACCESSAT=1;                  AC_SUBST([HAVE_FACCESSAT])
  HAVE_FCHDIR=1;                     AC_SUBST([HAVE_FCHDIR])
  HAVE_FCHOWNAT=1;                   AC_SUBST([HAVE_FCHOWNAT])
  HAVE_FDATASYNC=1;                  AC_SUBST([HAVE_FDATASYNC])
  HAVE_FSYNC=1;                      AC_SUBST([HAVE_FSYNC])
  HAVE_FTRUNCATE=1;                  AC_SUBST([HAVE_FTRUNCATE])
  HAVE_GETDTABLESIZE=1;              AC_SUBST([HAVE_GETDTABLESIZE])
  HAVE_GETENTROPY=1;                 AC_SUBST([HAVE_GETENTROPY])
  HAVE_GETGROUPS=1;                  AC_SUBST([HAVE_GETGROUPS])
  HAVE_GETHOSTNAME=1;                AC_SUBST([HAVE_GETHOSTNAME])
  HAVE_GETLOGIN=1;                   AC_SUBST([HAVE_GETLOGIN])
  HAVE_GETPAGESIZE=1;                AC_SUBST([HAVE_GETPAGESIZE])
  HAVE_GETPASS=1;                    AC_SUBST([HAVE_GETPASS])
  HAVE_GROUP_MEMBER=1;               AC_SUBST([HAVE_GROUP_MEMBER])
  HAVE_LCHOWN=1;                     AC_SUBST([HAVE_LCHOWN])
  HAVE_LINK=1;                       AC_SUBST([HAVE_LINK])
  HAVE_LINKAT=1;                     AC_SUBST([HAVE_LINKAT])
  HAVE_PIPE=1;                       AC_SUBST([HAVE_PIPE])
  HAVE_PIPE2=1;                      AC_SUBST([HAVE_PIPE2])
  HAVE_PREAD=1;                      AC_SUBST([HAVE_PREAD])
  HAVE_PWRITE=1;                     AC_SUBST([HAVE_PWRITE])
  HAVE_READLINK=1;                   AC_SUBST([HAVE_READLINK])
  HAVE_READLINKAT=1;                 AC_SUBST([HAVE_READLINKAT])
  HAVE_SETHOSTNAME=1;                AC_SUBST([HAVE_SETHOSTNAME])
  HAVE_SLEEP=1;                      AC_SUBST([HAVE_SLEEP])
  HAVE_SYMLINK=1;                    AC_SUBST([HAVE_SYMLINK])
  HAVE_SYMLINKAT=1;                  AC_SUBST([HAVE_SYMLINKAT])
  HAVE_UNLINKAT=1;                   AC_SUBST([HAVE_UNLINKAT])
  HAVE_USLEEP=1;                     AC_SUBST([HAVE_USLEEP])
  HAVE_DECL_ENVIRON=1;               AC_SUBST([HAVE_DECL_ENVIRON])
  HAVE_DECL_EXECVPE=1;               AC_SUBST([HAVE_DECL_EXECVPE])
  HAVE_DECL_FCHDIR=1;                AC_SUBST([HAVE_DECL_FCHDIR])
  HAVE_DECL_FDATASYNC=1;             AC_SUBST([HAVE_DECL_FDATASYNC])
  HAVE_DECL_GETDOMAINNAME=1;         AC_SUBST([HAVE_DECL_GETDOMAINNAME])
  HAVE_DECL_GETLOGIN=1;              AC_SUBST([HAVE_DECL_GETLOGIN])
  HAVE_DECL_GETLOGIN_R=1;            AC_SUBST([HAVE_DECL_GETLOGIN_R])
  HAVE_DECL_GETPAGESIZE=1;           AC_SUBST([HAVE_DECL_GETPAGESIZE])
  HAVE_DECL_GETUSERSHELL=1;          AC_SUBST([HAVE_DECL_GETUSERSHELL])
  HAVE_DECL_SETHOSTNAME=1;           AC_SUBST([HAVE_DECL_SETHOSTNAME])
  HAVE_DECL_TRUNCATE=1;              AC_SUBST([HAVE_DECL_TRUNCATE])
  HAVE_DECL_TTYNAME_R=1;             AC_SUBST([HAVE_DECL_TTYNAME_R])
  HAVE_OS_H=0;                       AC_SUBST([HAVE_OS_H])
  HAVE_SYS_PARAM_H=0;                AC_SUBST([HAVE_SYS_PARAM_H])
  REPLACE_ACCESS=0;                  AC_SUBST([REPLACE_ACCESS])
  REPLACE_CHOWN=0;                   AC_SUBST([REPLACE_CHOWN])
  REPLACE_CLOSE=0;                   AC_SUBST([REPLACE_CLOSE])
  REPLACE_COPY_FILE_RANGE=0;         AC_SUBST([REPLACE_COPY_FILE_RANGE])
  REPLACE_DUP=0;                     AC_SUBST([REPLACE_DUP])
  REPLACE_DUP2=0;                    AC_SUBST([REPLACE_DUP2])
  REPLACE_EXECL=0;                   AC_SUBST([REPLACE_EXECL])
  REPLACE_EXECLE=0;                  AC_SUBST([REPLACE_EXECLE])
  REPLACE_EXECLP=0;                  AC_SUBST([REPLACE_EXECLP])
  REPLACE_EXECV=0;                   AC_SUBST([REPLACE_EXECV])
  REPLACE_EXECVE=0;                  AC_SUBST([REPLACE_EXECVE])
  REPLACE_EXECVP=0;                  AC_SUBST([REPLACE_EXECVP])
  REPLACE_EXECVPE=0;                 AC_SUBST([REPLACE_EXECVPE])
  REPLACE_FACCESSAT=0;               AC_SUBST([REPLACE_FACCESSAT])
  REPLACE_FCHOWNAT=0;                AC_SUBST([REPLACE_FCHOWNAT])
  REPLACE_FTRUNCATE=0;               AC_SUBST([REPLACE_FTRUNCATE])
  REPLACE_GETCWD=0;                  AC_SUBST([REPLACE_GETCWD])
  REPLACE_GETDOMAINNAME=0;           AC_SUBST([REPLACE_GETDOMAINNAME])
  REPLACE_GETDTABLESIZE=0;           AC_SUBST([REPLACE_GETDTABLESIZE])
  REPLACE_GETLOGIN_R=0;              AC_SUBST([REPLACE_GETLOGIN_R])
  REPLACE_GETGROUPS=0;               AC_SUBST([REPLACE_GETGROUPS])
  REPLACE_GETPAGESIZE=0;             AC_SUBST([REPLACE_GETPAGESIZE])
  REPLACE_GETPASS=0;                 AC_SUBST([REPLACE_GETPASS])
  REPLACE_GETPASS_FOR_GETPASS_GNU=0; AC_SUBST([REPLACE_GETPASS_FOR_GETPASS_GNU])
  REPLACE_ISATTY=0;                  AC_SUBST([REPLACE_ISATTY])
  REPLACE_LCHOWN=0;                  AC_SUBST([REPLACE_LCHOWN])
  REPLACE_LINK=0;                    AC_SUBST([REPLACE_LINK])
  REPLACE_LINKAT=0;                  AC_SUBST([REPLACE_LINKAT])
  REPLACE_LSEEK=0;                   AC_SUBST([REPLACE_LSEEK])
  REPLACE_PREAD=0;                   AC_SUBST([REPLACE_PREAD])
  REPLACE_PWRITE=0;                  AC_SUBST([REPLACE_PWRITE])
  REPLACE_READ=0;                    AC_SUBST([REPLACE_READ])
  REPLACE_READLINK=0;                AC_SUBST([REPLACE_READLINK])
  REPLACE_READLINKAT=0;              AC_SUBST([REPLACE_READLINKAT])
  REPLACE_RMDIR=0;                   AC_SUBST([REPLACE_RMDIR])
  REPLACE_SLEEP=0;                   AC_SUBST([REPLACE_SLEEP])
  REPLACE_SYMLINK=0;                 AC_SUBST([REPLACE_SYMLINK])
  REPLACE_SYMLINKAT=0;               AC_SUBST([REPLACE_SYMLINKAT])
  REPLACE_TRUNCATE=0;                AC_SUBST([REPLACE_TRUNCATE])
  REPLACE_TTYNAME_R=0;               AC_SUBST([REPLACE_TTYNAME_R])
  REPLACE_UNLINK=0;                  AC_SUBST([REPLACE_UNLINK])
  REPLACE_UNLINKAT=0;                AC_SUBST([REPLACE_UNLINKAT])
  REPLACE_USLEEP=0;                  AC_SUBST([REPLACE_USLEEP])
  REPLACE_WRITE=0;                   AC_SUBST([REPLACE_WRITE])
  UNISTD_H_HAVE_SYS_RANDOM_H=0;      AC_SUBST([UNISTD_H_HAVE_SYS_RANDOM_H])
  UNISTD_H_HAVE_WINSOCK2_H=0;        AC_SUBST([UNISTD_H_HAVE_WINSOCK2_H])
  UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS=0;
                           AC_SUBST([UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS])
])
