#!/usr/bin/env bash

export STELLAR_CORE_CFG="https://gist.github.com/otokarev/1a2fb272816d755773f2009051709af0/raw/ef83514d5c6d21757872eb2aa7d804a44703dca1/stellar-core.testnet.cfg"

export STELLAR_CORE_DATA_DISK=

export STELLAR_HORIZON_IMAGE="gcr.io/lucid-course-142515/github-otokarev-docker-stellar-horizon:v0.1.0"
export STELLAR_CORE_IMAGE="gcr.io/lucid-course-142515/github-otokarev-docker-stellar-core:v0.1.4"

export DATABASE_INSTANCE="<PROJECT>:<ZONE>:<INSTANCE ID>=tcp:5432"
export STELLAR_CORE_DATABASE_URL="<DATABASE_URL in format postgres://USER:PASSWORD@127.0.0.1/DATABASE?sslmode=disable>"
export STELLAR_HORIZON_DATABASE_URL="<DATABASE_URL in format postgres://USER:PASSWORD@127.0.0.1/DATABASE?sslmode=disable>"
