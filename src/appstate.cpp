#include <QQuickItem>
#include <QDebug>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardPaths>
#include "appstate.h"

AppState::AppState(QQuickItem* root) :
    QObject(0),
    root(root),
    clear_clipboard(true)
{
    QDir data_dir(QStandardPaths::writableLocation(QStandardPaths::DataLocation));
    QFile state(data_dir.relativeFilePath("state.json"));
    if (state.open(QIODevice::ReadOnly)) {
        QString data = state.readAll();
        state.close();
        QJsonDocument d = QJsonDocument::fromJson(data.toUtf8());
        if (d.isObject()) {
            QJsonObject stateobj = d.object();
            if (stateobj["clear_clipboard"].isBool()) {
                clear_clipboard = stateobj["clear_clipboard"].toBool();
            }
        }
    }
    root->setProperty("clear_clipboard", clear_clipboard);
}

void AppState::saveState() {
    clear_clipboard = root->property("clear_clipboard").toBool();
    QDir data_dir(QStandardPaths::writableLocation(QStandardPaths::DataLocation));
    QFile state(data_dir.relativeFilePath("state.json"));
    if (state.open(QIODevice::WriteOnly)) {
        QJsonObject stateobj;
        stateobj["clear_clipboard"] = clear_clipboard;
        QJsonDocument doc(stateobj);
        state.write(doc.toJson());
        state.close();
    }
}
