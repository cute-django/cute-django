#include <QIcon>
#include <QtWebEngine/qtwebengineglobal.h>
#include "launcher.h"

#define DEFAULT_WAIT_TIMEOUT 3000 // ms

Launcher::Launcher(int argc, char **argv) : QApplication(argc, argv)
{
    this->setWindowIcon(QIcon(":/icon"));

    QString app_path = QCoreApplication::applicationDirPath() + "/../dist/bootstrap/";

    m_webServer.setProcessChannelMode(QProcess::ForwardedChannels);
    m_webServer.setWorkingDirectory(app_path);
    m_webServer.start(app_path + "bootstrap");

    QtWebEngine::initialize();

    m_qmlEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    m_webServer.waitForStarted(DEFAULT_WAIT_TIMEOUT);
    m_webServer.waitForReadyRead(DEFAULT_WAIT_TIMEOUT);
}

Launcher::~Launcher()
{
    m_webServer.terminate();

    if (!m_webServer.waitForFinished())
        m_webServer.kill();
}

