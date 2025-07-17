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
                ColumnLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 20

                    Text {
                       font.pixelSize: 15
                       text: "My task number one"
                    }
                    Text {
                       font.pixelSize: 15
                       text: "My task number one"
                    }
                }
            }

        }
    }
}
