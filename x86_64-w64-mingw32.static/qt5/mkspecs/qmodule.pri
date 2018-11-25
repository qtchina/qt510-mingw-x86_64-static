EXTRA_DEFINES += Q_USE_SYBASE
host_build {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
} else {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
}
QT.global_private.enabled_features = sse2 alloca_malloc_h alloca avx2 dbus dbus-linked gui network qml-debug sql system-zlib testlib widgets xml
QT.global_private.disabled_features = alloca_h android-style-assets private_tests libudev posix_fallocate reduce_exports reduce_relocations release_tools stack-protector-strong
PKG_CONFIG_EXECUTABLE = x86_64-w64-mingw32.static-pkg-config
QMAKE_LIBS_DBUS = -L/opt/mxe/usr/x86_64-w64-mingw32.static/lib/pkgconfig/../..//lib -ldbus-1 -lws2_32 -liphlpapi -ldbghelp
QMAKE_DEFINES_DBUS = DBUS_STATIC_BUILD
QMAKE_INCDIR_DBUS = /opt/mxe/usr/x86_64-w64-mingw32.static/lib/pkgconfig/../..//include/dbus-1.0 /opt/mxe/usr/x86_64-w64-mingw32.static/lib/pkgconfig/../..//lib/dbus-1.0/include
QT_COORD_TYPE = double
QMAKE_LIBS_ZLIB = -lz
CONFIG -= precompile_header
CONFIG += cross_compile sse2 aesni sse3 ssse3 sse4_1 sse4_2 avx avx2 avx512f avx512bw avx512cd avx512dq avx512er avx512ifma avx512pf avx512vbmi avx512vl compile_examples f16c largefile rdrnd shani
QT_BUILD_PARTS += libs
QT_HOST_CFLAGS_DBUS += -DDBUS_STATIC_BUILD -I//opt/mxe/usr/x86_64-w64-mingw32.static/lib/pkgconfig/../..//include/dbus-1.0 -I//opt/mxe/usr/x86_64-w64-mingw32.static/lib/pkgconfig/../..//lib/dbus-1.0/include
