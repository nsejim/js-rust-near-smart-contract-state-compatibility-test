#!/bin/sh

echo ">> Building contract"

near-sdk-js build src/contract.ts build/rust_js_data_compatibility.wasm
