#!/usr/bin/bash
#
# script runs mesher,database generation and solver
# using this example setup
#

###################################################

# number of processes
NPROC=1

##################################################

echo "running example: `date`"
currentdir=`pwd`


#mkdir -p bin
mkdir -p OUTPUT_FILES/DATABASES_MPI

rm -f OUTPUT_FILES/*
rm -rf OUTPUT_FILES/DATABASES_MPI/*

cd $currentdir

# links executables
#cd bin/
#ln -s ../../bin/* .
#cd ../

# stores setup
cp DATA/meshfem3D_files/Mesh_Par_file OUTPUT_FILES/
cp DATA/Par_file OUTPUT_FILES/
cp DATA/CMTSOLUTION OUTPUT_FILES/
cp DATA/STATIONS OUTPUT_FILES/

# decomposes mesh
echo
echo "running mesher..."
echo
./bin/xmeshfem3D
mv OUTPUT_FILES/output_mesher.txt OUTPUT_FILES/output_meshfem3D.txt

# runs database generation
echo
echo "  running database generation..."
echo
./bin/xgenerate_databases

# runs simulation
echo
echo "  running solver..."
echo
./bin/xspecfem3D

echo
echo "see results in directory: OUTPUT_FILES/"
echo
echo "done"
date


