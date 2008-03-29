#!/bin/sh

# TODO:
#   Accept --target=... (defaults to /usr/local/bin && /usr/locat/etc/mysqldoc/
#   Sets environmental variables to the above?
#   Update the perl script to MYSQLDOC_HOME && MYSQLDOC_TEMPLATE_HOME
#   Help output

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

echo "Preparing your system for mysqldoc"

printf "Installing Pod::Usage ... "
perl -MCPAN -e'install Pod::Usage' >> /dev/null

if [[ $? -eq 0 ]]; then
  printf "OK\n"
else
  printf "FAILED\N"
  exit 1
fi

printf "Installing Getopt::Long ... "
perl -MCPAN -e'install Getopt::Long' >> /dev/null

if [[ $? -eq 0 ]]; then
  printf "OK\n"
else
  printf "FAILED\N"
  exit 1
fi

printf "Installing DBI ... "
perl -MCPAN -e'install DBI' >> /dev/null

if [[ $? -eq 0 ]]; then
  printf "OK\n"
else
  printf "FAILED\N"
  exit 1
fi

printf "Installing XML::XSLT ... "
perl -MCPAN -e'install XML::XSLT' >> /dev/null

if [[ $? -eq 0 ]]; then
  printf "OK\n"
else
  printf "FAILED\N"
  exit 1
fi

printf "Installing Config::General ... "
perl -MCPAN -e'install Config::General' >> /dev/null

if [[ $? -eq 0 ]]; then
  printf "OK\n"
else
  printf "FAILED\N"
  exit 1
fi

