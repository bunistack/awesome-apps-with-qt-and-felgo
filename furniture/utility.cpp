#include "utility.h"

Utility::Utility(QObject *parent) : QObject(parent)
{

}

QString Utility::readFile(QString filename, QIODevice::OpenMode flags)
{
    QFile file(filename);

    if(!file.open(flags)){
        qCritical() << " -- unable to open file at: " << filename;
        return QString();
    }

    QByteArray data = file.readAll();
    file.close();
    return QString::fromStdString(data.toStdString());
}

QString Utility::currencyFormat(double value)
{
    return QString("%L1").arg(value, 0, 'f', 2);
}
