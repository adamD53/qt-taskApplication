#include "task.h"

Task::Task(QString &description, QObject *parent)
    : QObject{parent}, m_Description(description), m_Completed(false)
{}

QString Task::getDescription()
{
    return m_Description;
}

bool Task::getCompletionStatus()
{
    return m_Completed;
}

void Task::completeTask()
{
    if (!m_Completed)
    {
        m_Completed = true;
        qInfo() << "Task completed: " << m_Description;

        emit taskCompleted(m_Description);
    }
}
