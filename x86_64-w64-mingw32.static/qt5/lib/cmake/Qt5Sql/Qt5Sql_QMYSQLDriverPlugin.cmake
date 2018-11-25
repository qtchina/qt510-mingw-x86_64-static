
add_library(Qt5::QMYSQLDriverPlugin MODULE IMPORTED)

_populate_Sql_plugin_properties(QMYSQLDriverPlugin RELEASE "sqldrivers/libqsqlmysql.a")

list(APPEND Qt5Sql_PLUGINS Qt5::QMYSQLDriverPlugin)
