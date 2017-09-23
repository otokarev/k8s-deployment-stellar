#!/usr/bin/env bash

export STELLAR_CORE_CFG=https://gist.github.com/otokarev/1a2fb272816d755773f2009051709af0/raw/14a5e6eb3854a3404a4a4baad02f5e7fea33a3a8/stellar-core.testnet.cfg

export STELLAR_HORIZON_IMAGE=gcr.io/lucid-course-142515/github-otokarev-docker-stellar-horizon:34b09e284b1051ac92579188c151301cec712cba
export STELLAR_CORE_IMAGE=gcr.io/lucid-course-142515/github-otokarev-docker-stellar-core:v0.1.2

export PROJECT=
export GS_ACCESS_KEY_ID=
export GS_SECRET_ACCESS_KEY=

export DATABASE_INSTANCE=
export STELLAR_CORE_DATABASE_URL="<DATABASE_URL in format postgres://USER:PASSWORD@127.0.0.1/DATABASE?sslmode=disable>"
export STELLAR_HORIZON_DATABASE_URL="<DATABASE_URL in format postgres://USER:PASSWORD@127.0.0.1/DATABASE?sslmode=disable>"
