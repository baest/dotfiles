#!/usr/bin/env sh

echo "NS for $1"
dig +short NS "$@"

echo "DNSKEY for $1"
dig +short DNSKEY "$@"

echo "DS for $1"
dig +short DS "$@"
