#!/bin/bash
set -e # exit immediately if any command returns a non-zero exit code

mpirun -n 4 abinit gs.abi > gs.log
mpirun -n 4 abinit dfpt.abi > dfpt.log
rm -f out_DDB
mrgddb out_DDB *_DDB.nc > ddb.log

mpirun -n 4 abinit gw.abi > gw.log

./clean.sh
