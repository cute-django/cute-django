#include <csignal>
#include "launcher.h"

using namespace std;

struct CleanExit{
    CleanExit() {
        signal(SIGINT, &CleanExit::exitQt);
        signal(SIGKILL, &CleanExit::exitQt);
        signal(SIGTERM, &CleanExit::exitQt);
        signal(SIGABRT, &CleanExit::exitQt) ;
    }

    static void exitQt(int sig) {
        QCoreApplication::exit(sig);
    }
};

int main(int argc, char *argv[])
{
    CleanExit cleanExit;
    Launcher app(argc, argv);
    return app.exec();
}
