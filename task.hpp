#pragma once

#include <QString>

class Task
{
public:
    Task(const QString &title, bool done = false);

    QString getTitle();
    bool getDone();

    void setTitle(const QString& title);
    void setDone(bool done);
private:
    QString m_title;
    bool m_done;
};
