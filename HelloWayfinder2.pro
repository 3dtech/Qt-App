TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc \
    images.qrc \
    text.qrc \
    external.qrc \
    external/WayfinderQML/resources.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = ./external/WayfinderQML

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=
