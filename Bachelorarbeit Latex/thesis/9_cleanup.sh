#!/bin/sh

echo "Cleaning up in two steps.."
echo " (1) We remove the local tmp dir: 'rm -rf tmp/' ..."
rm -rf tmp/

echo " (2) Optionally, remove the biber cache files manually. It could take a while: execute 'rm -r $(biber --cache)'"
# rm -rf $(biber --cache)
