# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = passy

CONFIG += sailfishapp

SOURCES += src/passy.cpp

OTHER_FILES += qml/passy.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/AboutPage.qml \
    rpm/passy.yaml \
    passy.desktop \
    qml/utils.js \
    rpm/passy.yaml

