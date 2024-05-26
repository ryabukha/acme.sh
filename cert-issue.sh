#!/usr/bin/env sh
set -o errexit
set -o nounset
set -o pipefail

function _sh {
    local command=$1
    echo -e "\e[1;34m$(pwd)\e[32m\$ ${command}\e[39m"
    sh -c "${command}"
}

_sh "acme.sh --issue --dns dns_cf -d ${MY_DOMAIN} --server letsencrypt_test -k 2048 -w /tmp"
_sh "acme.sh --install-cert -d ${MY_DOMAIN} --key-file /tmp/key.pem --cert-file /tmp/cert.pem --fullchain-file /tmp/fullchain.pem --reloadcmd 'cat /tmp/cert.pem'"
_sh "aws acm import-certificate --certificate fileb://tmp/cert.pem --certificate-chain fileb://tmp/fullchain.pem --private-key fileb://tmp/key.pem --certificate-arn ${AWS_CERTIFICATE_ARN}"
