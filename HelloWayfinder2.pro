TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml/qml.qrc \
    images.qrc \
    external.qrc \
    external/WayfinderQML/resources.qrc \
    styles/base/base_styles.qrc \
    styles/ios/ios_styles.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = ./external/WayfinderQML \ ./styles/base \ ./styles/ios

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=
