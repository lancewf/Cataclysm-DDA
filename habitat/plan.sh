pkg_name=Cataclysm-DDA
pkg_origin=lancewf
pkg_version="0.1.0"
pkg_maintainer="Lance Finfrock <lancewf@gmail.com>"
pkg_license=("Apache-2.0")
pkg_deps=()
pkg_build_deps=(core/git core/make)
pkg_deps=(core/ncurses5 core/lua core/gettext core/gcc)
pkg_bin_dirs=(bin)

do_build() {
  cp -r $PLAN_CONTEXT/../ $HAB_CACHE_SRC_PATH/$pkg_dirname
  cd ${HAB_CACHE_SRC_PATH}/${pkg_dirname}

  make clean
  make

  return 0
}

do_install() {
  # mkdir $pkg_prefix/bin/
  cp -r $HAB_CACHE_SRC_PATH/$pkg_dirname/cataclysm $pkg_prefix/.
  cp $PLAN_CONTEXT/config/cataclysm-launcher $pkg_prefix/bin/.
  chmod 777 $pkg_prefix/bin/cataclysm-launcher

  mkdir -p $pkg_prefix/share/cataclysm-dda/
  cp -r $HAB_CACHE_SRC_PATH/$pkg_dirname/data/* $pkg_prefix/share/cataclysm-dda/.

  return 0
}
