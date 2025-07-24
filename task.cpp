#include "task.hpp"

Task::Task(const QString &title, bool done): m_title(title), m_done(done) {}

QString Task::getTitle()
{
    return m_title;
}

bool Task::getDone()
{
    return m_done;
}

void Task::setTitle(const QString &title)
{
    if (m_title != title)
    {
        m_title = title;
    }
}

void Task::setDone(bool done)
{
    m_done = done;
}
