#ifndef UTILS_H
#define UTILS_H

#include <QObject>

class Utils : public QObject
{
    Q_OBJECT
public:
    explicit Utils(QObject *parent = 0);

signals:

public slots:
    QString passwordify(QByteArray password);
    QString genpass(const QString &password, const QString &site);

};

#endif // UTILS_H
