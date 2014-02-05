#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QGuiApplication>
#include <QQuickView>
#include <QQuickItem>
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>

#include <sailfishapp.h>
#include "appstate.h"

int main(int argc, char *argv[])
{
    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();
    view->setSource(SailfishApp::pathTo("qml/harbour-passy.qml"));

    AppState state(view->rootObject());

    QObject::connect(app, SIGNAL(aboutToQuit()), &state, SLOT(saveState()));
    view->show();
    return app->exec();

}

