# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-passy

CONFIG += sailfishapp

SOURCES += src/harbour-passy.cpp

OTHER_FILES += qml/harbour-passy.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/AboutPage.qml \
    rpm/harbour-passy.yaml \
    harbour-passy.desktop \
    qml/utils.js \
    rpm/harbour-passy.yaml

HEADERS +=

