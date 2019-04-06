#!/bin/bash

here=$(dirname $0)

$here/setup/cleanup.sh
doitlive play $here/scripts/deps-explode.sh
