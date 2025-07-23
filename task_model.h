#ifndef TaskModel_H
#define TaskModel_H

#include <QAbstractListModel>
#include <QHash>
#include <QVector>

#include "task.h"

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

private:
    QVector<Task*> m_tasks;

};

#endif // TaskModel_H
