#ifndef TASK_H
#define TASK_H

#include <QObject>
#include <QString>
#include <QDebug>

class Task : public QObject
{
    Q_OBJECT
public:
    explicit Task(QString &description, QObject *parent = nullptr);

    QString getDescription();
    bool getCompletionStatus();

    void completeTask();

signals:
    void taskCompleted(const QString &description);

private:
    QString m_Description;
    bool m_Completed;
};

#endif // TASK_H
