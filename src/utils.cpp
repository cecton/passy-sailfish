#include <QCryptographicHash>

#include "utils.h"

Utils::Utils(QObject *parent) :
    QObject(parent)
{
}

QString Utils::passwordify(QByteArray password)
{
    char symbols[] = {'!', '?', '+', '-', '=', '*', '/',
                      '@', '#', '$', '%', '&', '(', ')',
                      '[', ']', ';', ':', ',', '.', '<', '>'};

    password[0] = 'A' + (password[0] % 26);
    password[1] = 'a' + (password[1] % 26);
    password[2] = '0' + (password[2] % 10);
    password[3] = symbols[password[3] % sizeof(symbols)];

    return password;
}

QString Utils::genpass(const QString &password, const QString &site)
{
    QCryptographicHash *crypt =
            new QCryptographicHash(QCryptographicHash::Sha1);
    crypt->addData(("_" + password + "_" + site + "_").toLatin1());
    QByteArray fin = crypt->result().toBase64();

    return passwordify(fin).left(26);
}
