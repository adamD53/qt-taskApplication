#include "task_model.hpp"

TaskModel::TaskModel(QObject *parent)
    : QAbstractListModel{parent}
{
    TaskModel::addTask("task1");
    TaskModel::addTask("task2");
    TaskModel::addTask("task3");
}

QHash<int, QByteArray> TaskModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TitleRole] = "name";
    roles[DoneRole] = "done";

    return roles;
}

int TaskModel::rowCount(const QModelIndex &parent) const
{
    return m_tasks.count();
}

QVariant TaskModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_tasks.count())
        return QVariant();

    switch (role)
    {
        case TitleRole:
            return m_tasks[index.row()]->getTitle();
        case DoneRole:
            return m_tasks[index.row()]->getDone();
        default:
            return QVariant();
    }

}

bool TaskModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_tasks.count())
        return false;

    switch (role)
    {
    case TitleRole:
        m_tasks[index.row()]->setTitle(value.toString());
        break;
    case DoneRole:
        m_tasks[index.row()]->setDone(value.toBool());
        break;
    default:
        return false;
    }

    emit dataChanged(index, index, { role });
    return true;
}

void TaskModel::addTask(const QString &title)
{
    qDebug() << "add Task()";
    beginInsertRows(QModelIndex(), m_tasks.size(), m_tasks.size());
    m_tasks.append(new Task(title));
    endInsertRows();
}















