#!/bin/sh

vllm serve --dtype=half ${MODEL} --max-model-len ${MAX_MODEL_LEN}

exec sleep infinity
