#ifndef APPSTATE_H
#define APPSTATE_H

#include <QObject>
#include <QQuickItem>

class AppState : public QObject
{
    Q_OBJECT

public:
    explicit AppState(QQuickItem* root);

    bool clear_clipboard;

signals:

public slots:

    void saveState();


private:
    QQuickItem* root;
};

#endif // APPSTATE_H
