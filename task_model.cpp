#include "task_model.h"

TaskModel::TaskModel(QObject *parent)
    : QAbstractListModel{parent}
{
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
    m_tasks.append(new Task("my task1"));
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
    return true;
}















