#ifndef IOSUTILS_H
#define IOSUTILS_H

#include <QObject>

class IOSUtils : public QObject
{
    Q_OBJECT
public:
    explicit IOSUtils(QObject *parent = nullptr);

    Q_INVOKABLE static int statusBarHeight();

signals:

};

#endif // IOSUTILS_H
