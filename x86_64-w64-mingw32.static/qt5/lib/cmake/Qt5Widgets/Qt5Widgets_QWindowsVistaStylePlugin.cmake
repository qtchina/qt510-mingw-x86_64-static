
add_library(Qt5::QWindowsVistaStylePlugin MODULE IMPORTED)

_populate_Widgets_plugin_properties(QWindowsVistaStylePlugin RELEASE "styles/libqwindowsvistastyle.a")

list(APPEND Qt5Widgets_PLUGINS Qt5::QWindowsVistaStylePlugin)
