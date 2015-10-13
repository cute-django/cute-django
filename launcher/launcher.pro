TEMPLATE = app

QT += qml quick widgets webengine

SOURCES += main.cpp \
    launcher.cpp

RESOURCES += qml.qrc

RC_ICONS = icon.ico
ICON = icon.icns

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    launcher.h
