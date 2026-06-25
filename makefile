SHELL := /usr/bin/env bash
.SHELLFLAGS := -o pipefail -c

WEB_CLIENT_PORT ?= 5173
VITE_HOST ?= 0.0.0.0
WS_GATEWAY_HOST ?= 127.0.0.1
WS_GATEWAY_PORT ?= 8787
GATEWAY_URL ?= ws://$(WS_GATEWAY_HOST):$(WS_GATEWAY_PORT)/ws
SERVER_PORT ?= 7777

.PHONY: help deps dev typecheck test build preview android-sync android-open android-build-debug

help:
	@echo "Yagodka Android client commands:"
	@echo "  make deps                         # npm install"
	@echo "  make dev                          # Vite dev server for shared UI"
	@echo "  make typecheck                    # tsc --noEmit"
	@echo "  make test                         # node test runner"
	@echo "  make build                        # Vite/PWA assets"
	@echo "  make android-sync                 # build + cap sync android"
	@echo "  make android-open                 # open Android Studio"
	@echo "  make android-build-debug          # build debug APK"

deps:
	npm install

dev: deps
	VITE_GATEWAY_URL="$(GATEWAY_URL)" npm run dev -- --host $(VITE_HOST) --port $(WEB_CLIENT_PORT)

typecheck: deps
	npm run typecheck

test: deps
	npm run test

build: deps
	npm run build

preview: deps
	npm run preview -- --host $(VITE_HOST) --port $(WEB_CLIENT_PORT)

android-sync: deps
	npm run android:sync

android-open: deps
	npm run android:open

android-build-debug: deps
	npm run android:build:debug
