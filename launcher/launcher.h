#ifndef LAUNCHER_H
#define LAUNCHER_H

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QProcess>

class Launcher : public QApplication
{
    Q_OBJECT

private:
    QProcess m_webServer;
    QQmlApplicationEngine m_qmlEngine;

public:
    explicit Launcher(int argc, char **argv);
    virtual ~Launcher();
};

#endif // LAUNCHER_H
