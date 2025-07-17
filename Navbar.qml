import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    color: "black"

    property int fontSize: 18

    Rectangle {
        width: 240
        height: 240
        color: "transparent"

        ColumnLayout {
            spacing: 5
            anchors.fill: parent
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 15

            Image {
                Layout.alignment: Qt.AlignRight
                source: "qrc:/img/close.svg"
            }

            Text {
                text: "Today"
                color: "white"
                font.pixelSize: fontSize
            }

            Text {
                text: "Tomorrow"
                color: "white"
                font.pixelSize: fontSize
            }

            Text {
                text: "Weekly report"
                color: "white"
                font.pixelSize: fontSize
            }

            Text {
                text: "About"
                color: "white"
                font.pixelSize: fontSize
            }
        }
    }
}



