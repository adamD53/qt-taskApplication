import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {

    Rectangle {
        height: 200
        width: 500

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 20

            Text {
                text: "<b>19</b> june"
                font.pixelSize: 30
            }

            Rectangle {
                id: input
                Layout.fillWidth: true
                Layout.minimumWidth: 200
                Layout.preferredWidth: 500
                height: 30

                RowLayout {
                    anchors.fill: parent
                    anchors.centerIn: parent

                    Rectangle {
                        id: textField
                        Layout.fillWidth: true
                        Layout.minimumWidth: 200
                        Layout.preferredWidth: 400
                        Layout.fillHeight: true
                        border.color: "grey"

                        TextInput {
                            text: "Enter"
                            anchors.centerIn: parent
                        }
                    }

                    Button {
                        highlighted: true
                        Text {
                            text: "Add"
                            anchors.centerIn: parent
                        }
                    }
                }
            }


            Text {
                text: "Today's tasks:"
                font.pixelSize: 20
            }

            Rectangle {
                width: 100
                height: 300

                ListView {
                    anchors.fill: parent
                    spacing: 10
                    model: taskModelView
                    delegate: Text {
                        text: name
                        font.pixelSize: 17
                    }

                }
            }

        }
    }
}
