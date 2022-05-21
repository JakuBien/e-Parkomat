#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QQmlEngine>
#include "login.h"
#include "database.h"
#include "navigation.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //Pointer to login class
    QScopedPointer<login> log(new login);
    //Pointer to database class
    QScopedPointer<database>  db(new database);
    //Pointer to navigation
    QScopedPointer<navigation> nav(new navigation);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    //Handle from login class
    engine.rootContext()->setContextProperty("login", log.data());
    //Handle from database class
    engine.rootContext()->setContextProperty("db", db.data());
    //Handle from navigation class
    engine.rootContext()->setContextProperty("nav", nav.data());

    return app.exec();
}
