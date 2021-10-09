#include <QApplication>
#include <FelgoApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "utility.h"

#ifdef Q_OS_IOS
    #include "ios/src/iosutils.h"
#endif

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("bunistack");
    QCoreApplication::setOrganizationDomain("bunistack.com");
    QCoreApplication::setApplicationName("Victoria Furnitures");

    QApplication app(argc, argv);

    FelgoApplication felgo;

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

#ifdef Q_OS_IOS
    IOSUtils *iOSUtils = new IOSUtils(&engine);
    engine.rootContext()->setContextProperty("IOSUtils", iOSUtils);
#endif

    // handles simple utility functions
    Utility *utility = new Utility(&engine);

    engine.rootContext()->setContextProperty("Utility",utility);

    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/AppUtil.qml"),"AppUtil",1,0,"AppUtil");

    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}
