#include <QApplication>
#include <FelgoApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "utility.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("bunistack");
    QCoreApplication::setOrganizationDomain("bunistack.com");
    QCoreApplication::setApplicationName("Foodie");

    QApplication app(argc, argv);

    FelgoApplication felgo;

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    // handles simple utility functions
    Utility *utility = new Utility(&engine);

    engine.rootContext()->setContextProperty("Utility",utility);

    // register singletons
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/AppUtil.qml"),"AppUtil",1,0,"AppUtil");
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/SVG.qml"),"SVG",1,0,"SVG");

    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}
