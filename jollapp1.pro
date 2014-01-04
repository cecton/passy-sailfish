# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = jollapp1

CONFIG += sailfishapp

SOURCES += src/jollapp1.cpp

OTHER_FILES += qml/jollapp1.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/jollapp1.spec \
    rpm/jollapp1.yaml \
    jollapp1.desktop \
    rpm/jollapp1.spec \
    qml/utils.js

