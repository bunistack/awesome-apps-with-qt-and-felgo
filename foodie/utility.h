#ifndef UTILITY_H
#define UTILITY_H

#include <QObject>
#include <QDir>
#include <QStandardPaths>
#include <QDebug>
#include <QFile>

using namespace std;

class Utility : public QObject
{
    Q_OBJECT
public:
    explicit Utility(QObject *parent = nullptr);

    Q_INVOKABLE static QString readFile(QString filename, QIODevice::OpenMode flags = QIODevice::ReadOnly);

signals:


};

#endif // UTILITY_H
