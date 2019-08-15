#!/usr/bin/env bash
pushd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --go-completer --java-completer
popd
# --ts-completer for TypeScript
