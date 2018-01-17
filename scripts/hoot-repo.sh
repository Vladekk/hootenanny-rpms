#!/bin/bash
set -euo pipefail

HOOT_BASEURL=${HOOT_BASEURL:-https://s3.amazonaws.com/hoot-repo/el7}
HOOT_KEY=/etc/pki/rpm-gpg/RPM-GPG-KEY-Hoot

cat > $HOOT_KEY <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQINBFoM6lMBEADUmtwzditt62vgkuMVZatYpidvqK4gfE2/V8bMnk5ULhoDdjeR
UQP/0INcb964xpnV05X65WTeQvv3WVq3DhXZkCd97UIjEq6HyeGBNH9iDziBfpT2
cObgqq+RYt78Rz2LiMmKpi2EhytVOn2kqdY3Kjl4IvW7MPa/U0CL03DN11esW/MJ
2kW/GaJBeE9s3q0HG3t1X+43zAJWqYQ/ZuT+ER6t9tuWjKFikdK7XFiorWVxLll1
6Yb79xwtj2/g3TdQxYs2rxj1SsL25EbLUuyTC0Oe/KYn3wzTpb2TBjhlqTVkEBaq
OhMINEQkeFUBEOvBs+XmkblksK3cIQZYldvGGyC4gHk7CNzNY3fuoNUe1A5mcReT
0qmVmd7eV7os6NfJCde69ctvZCSfWzKK2BswVk7mAnKLC+mNDCh9yJRmJajnEWsU
mPSFZxiVtSoxcGeZ1r8OXAsxFczI9QKd6GBY3VYiKwMI3nKyAk6avuKj6an1ZkJO
MZ+EWA60t2FMyeQcii2rwbTcqmX/JzeX6dwxo5JFGzyyWNu8u5M/EOBJfYQALQFo
luXVqK49UWmDTNYbCK4kUYSn1RJQk50sAwqhEfJpF6x5rzLQDHMZhyJ/G06G46If
COY9BjtLv1AeCfWolVDX60t9ZUwZR9uO6u9kum/npNByFi8/jzkHN83wWwARAQAB
tDZIb290ZW5hbm55IFBhY2thZ2luZyA8aG9vdC1wYWNrYWdpbmdAZGlnaXRhbGds
b2JlLmNvbT6JAjcEEwECACEFAloM6lMCGw8FCwkIBwMFFQoJCAsFFgIDAQACHgEC
F4AACgkQcDZlemdnoXSnag/9GEJEqrvSNCwZVgkCvQW00kKxNVSSmXgsZZAaD5u0
iuKPdAX3yMB1dqJCsY91Fgxw+O6Nrjk1C7o0XwDz8F6U1fDn1Sfsii9gm6OWTs9f
jGVu2ghVKnOYJ8NFIZCC22nrqHRlVW16bL143U7O9BEAEYQDm1aluaflQf3DS+uy
KNNGRxcOdbbN/8dRbssS5lyR59vL/LSiIpgeidSi8Jt637GslxsK0gdqhIDUXAHn
cMnehYaXRJC4t8CkPxlihRh90Vknkcg2tva8p8ZlZPRk1+aS1wJFKrCbv2xjuyw0
Yyb4r1MaDbRkQU3xPTVKYiz0owYyMMkKsHyBDVWaovc61FEQIiN3++lRzinbtXjh
gGbM89wR30l1jGYshrrwy/OGCMUOZJ2J2S+d4hFL4NmD/tj1vYN+g+tW9Xh6Qblk
mYpPL3100BhNdvWG3iDKkqsDBMjYkw8S7YLsQGfZUbdNDo03UxwfHlDjKVgewn1s
d7FLia3Qmv+2JHZ9r6r59pEsHE5kGB8rpVVuAWNgO8eJxrNn/I+/k2jTUITsLiSe
AaXnBwt0Dgq1kEcMdvcnOQ98p23OrMHUu0NSsSP45uhSAhoBoq4wXgaR4vx7NRuB
cJ3vkuvY+aLVXEx8/oQL3d8NJgHmBQsuoZlIva+Gf1tSh42capi/Zuk8Ahhp5BRn
7Nc=
=qZNF
-----END PGP PUBLIC KEY BLOCK-----
EOF

cat > /etc/yum.repos.d/hoot.repo <<EOF
[hoot]
name = Hootenanny Enterprise Linux
baseurl = ${HOOT_BASEURL}/\$basearch
enable = 1
gpgcheck = 1
repo_gpgcheck = 1
gpgkey=file://${HOOT_KEY}
EOF
