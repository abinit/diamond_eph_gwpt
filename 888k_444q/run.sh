#!/bin/bash
set -e # exit immediately if any command returns a non-zero exit code

mpirun -n 4 abinit groundstate.abi > gs.log
mpirun -n 4 abinit ddb.abi > ddb.log
rm -f out_DDB
mrgddb out_DDB *_DDB.nc

./clean.sh
