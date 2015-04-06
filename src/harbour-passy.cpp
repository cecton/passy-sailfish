#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QGuiApplication>
#include <QQuickView>
#include <QQuickItem>

#include <sailfishapp.h>

#include "utils.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<Utils>("com.passy.utils", 1, 0, "Utils");
    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();
    view->setSource(SailfishApp::pathTo("qml/harbour-passy.qml"));
    view->show();
    return app->exec();

}

