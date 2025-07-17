import QtQuick
import QtQuick.Layouts

Window {
    width: 1024
    height: 720
    visible: true
    title: qsTr("Task Application")

    RowLayout {
        anchors.fill: parent
        Navbar {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 240
        }
        TaskDisplay {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 500
            Layout.preferredWidth: 784
        }
    }


}
