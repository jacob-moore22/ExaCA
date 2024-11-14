#!/bin/bash -e

# Initialize variables with default values
machine="$1"
kokkos_build_type="$2"
build_cores="$3"

my_build="build-ExaCA-${kokkos_build_type}"

export scriptdir=`pwd`

cd ../
export topdir=`pwd`

echo "topdir = $topdir"

export basedir=${topdir}
echo "basedir = $basedir"

export srcdir=${basedir}
echo "srcdir = $srcdir"

export libdir=${topdir}/lib
echo "libdir = $libdir"

export builddir=${basedir}/${my_build}


export installdir=${basedir}/install
echo "installdir = $installdir"


export KOKKOS_SOURCE_DIR=${topdir}/kokkos
export KOKKOS_BUILD_DIR=${topdir}/builds/kokkos
export KOKKOS_INSTALL_DIR=${installdir}/kokkos-${kokkos_build_type}


echo "KOKKOS_SOURCE_DIR = $KOKKOS_SOURCE_DIR"
echo "KOKKOS_INSTALL_DIR = $KOKKOS_INSTALL_DIR"


export EXACA_INSTALL_DIR=${installdir}/exaca
export ExaCA_BASE_DIR=${basedir}
export ExaCA_SOURCE_DIR=${srcdir}
export ExaCA_BUILD_DIR=${builddir}

# # export MATAR_SOURCE_DIR=${libdir}/Elements/matar
# # export MATAR_BUILD_DIR=${builddir}/matar
# # export MATAR_INSTALL_DIR=${installdir}/matar

# export KOKKOS_SOURCE_DIR=${MATAR_SOURCE_DIR}/src/Kokkos/kokkos
# export KOKKOS_BUILD_DIR=${builddir}/kokkos
# export KOKKOS_INSTALL_DIR=${installdir}/kokkos-${kokkos_build_type}

export BUILD_CORES=$build_cores

cd $scriptdir

# Call the appropriate script to load modules based on the machine
# source machines/$machine-env.sh ${2}



