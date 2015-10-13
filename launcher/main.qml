import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
import QtWebEngine 1.1

ApplicationWindow {
    id: window

    property bool bootstrap: true

    title: qsTr("Cute Django Project")
    minimumWidth: 320
    minimumHeight: 480
    width: 1024
    height: 768
    visibility: Window.Maximized

    WebEngineView {
        id: webview
        url: "http://localhost:8000"
        anchors.fill: parent

        onLoadingChanged: {

            if (loadRequest.status == WebEngineView.LoadStartedStatus) {

                hidingPane.opacity = window.bootstrap ? 1 : 0.5;
                busyIndicator.opacity = 1;

            } else if (loadRequest.status == WebEngineView.LoadSucceededStatus) {

                hidingPane.opacity = 0;
                busyIndicator.opacity = 0;

                window.bootstrap = false;
            }
        }

        onFullScreenRequested: {

            if (request.toggleOn)
                window.showFullScreen();
            else
                window.showMaximized();

            request.accept();
        }
    }

    Rectangle {
        id: hidingPane
        anchors.fill: parent
        color: "#424a5d"

        Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.InBack } }
    }

    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: parent
        running: true
        opacity: 0
        style: BusyIndicatorStyle {
            indicator: Image {
                visible: control.running
                source: "loading.png"
                RotationAnimator on rotation {
                    running: control.running
                    loops: Animation.Infinite
                    duration: 2000
                    from: 0 ; to: 360
                }
            }
        }

        Behavior on opacity { NumberAnimation { duration: 500; easing.type: Easing.InBack } }
    }
}
