#!/bin/bash -e

solver="${1}"
debug="${2}"


cd $basedir

# Check if directory exists
if [ -d "${ExaCA_BUILD_DIRR}" ]; then
    echo "Removing old ExaCA build directory"
    rm -rf ${builddir}
else
    mkdir -p ${builddir}
fi






cmake_options=(
-B ${builddir}
-D CMAKE_PREFIX_PATH="${KOKKOS_INSTALL_DIR}"
-D CMAKE_INSTALL_PREFIX=$EXACA_INSTALL_DIR
# -D ExaCA_ENABLE_TESTING
#-D CMAKE_CXX_FLAGS="-I${matardir}/src"
)

if [ "$debug" = "true" ]; then
    echo "Setting debug to true for CMAKE build type"
    cmake_options+=(
        -DCMAKE_BUILD_TYPE=Debug
    )
fi


# Print CMake options for reference
echo "CMake Options: ${cmake_options[@]}"


# # Build ExaCA
# cmake --build ${ExaCA_BUILD_DIR}
# # Install ExaCA
# cmake --install ${ExaCA_BUILD_DIR}
# # cd ../



# Configure ExaCA
cmake "${cmake_options[@]}" -B "${ExaCA_BUILD_DIR}" -S "${ExaCA_BASE_DIR}"

# Build ExaCA
make -C "${ExaCA_BUILD_DIR}" -j${BUILD_CORES}

cd $basedir
