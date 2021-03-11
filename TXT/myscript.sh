#!/bin/bash
# Cicak bin Kadal
# Modified by Trigonometr1


FILES="my*.txt my*.sh"
SHA="SHA256SUM"

# HApus file SHA256SUM yang lama
echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc

# Buat SHA256SUM berdasarkan file dalam TXT/
echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

# Lakukan _checksum_
echo "sha256sum -c $SHA"
sha256sum -c $SHA

# Buat _signature_ kita ke SHA256SUM.asc
echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA

# Verifikasi _signature_ dengan gpg
echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

exit 0

# Tue 29 Sep 2020 11:02:39 AM WIB
# Thu 11 Mar 2021 12:13:28 AM WIB
