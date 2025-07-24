#pragma once

#include <QAbstractListModel>
#include <QHash>
#include <QVector>

#include "task.hpp"

class TaskModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum TaskRoles {
        TitleRole = Qt::UserRole + 1,
        DoneRole
    };

    explicit TaskModel(QObject *parent = nullptr);

    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);

    Q_INVOKABLE void addTask(const QString& task);

private:
    QVector<Task*> m_tasks;

};
