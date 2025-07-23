#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "task_model.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    TaskModel model(&app);

    engine.rootContext()->setContextProperty("taskModelView", &model);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("taskApplication", "Main");


    return app.exec();
}
