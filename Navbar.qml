import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle {
    height: parent.height
    width: 240
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

            Text {
                text: "close"
                color: "white"
                font.pixelSize: 15
                Layout.alignment: Qt.AlignRight
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



