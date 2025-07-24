#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSortFilterProxyModel>

#include "task_model.hpp"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    TaskModel model(&app);

    QSortFilterProxyModel *activeTasksProxy = new QSortFilterProxyModel(&app);
    activeTasksProxy->setSourceModel(&model);
    activeTasksProxy->setFilterRole(TaskModel::DoneRole);
    activeTasksProxy->setFilterFixedString("false");

    QSortFilterProxyModel *completedTasksProxy = new QSortFilterProxyModel(&app);
    completedTasksProxy->setSourceModel(&model);
    completedTasksProxy->setFilterRole(TaskModel::DoneRole);
    completedTasksProxy->setFilterFixedString("true");

    engine.rootContext()->setContextProperty("activeTasksModel", activeTasksProxy);
    engine.rootContext()->setContextProperty("completedTasksModel", completedTasksProxy);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("taskApplication", "Main");


    return app.exec();
}
