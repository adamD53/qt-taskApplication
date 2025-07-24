import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Rectangle {

    height: parent.height
    width: parent.width

    Component {
        id: taskComponent

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 45

            Rectangle {
                width: parent.width
                height: 1
                color: "#e6ebed"
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10

                CheckBox {
                    id: checkBox
                    Component.onCompleted: checkBox.checked = done
                    onCheckStateChanged: done = checkBox.checked
                    Layout.rightMargin: 5
                }

                Text {
                    text: model.name
                    font.pixelSize: 17
                }

                Item {
                    Layout.fillWidth: true
                }

                Text {
                    text: "Priority"
                    font.pixelSize: 10
                    color: "#d2d6d8"
                }
            }
        }
    }

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 20
        anchors.leftMargin: 40
        anchors.rightMargin: 40
        spacing: 0

        RowLayout {
            Layout.bottomMargin: 20
            Text {
                text: "19"
                font.weight: 800
                font.pixelSize: 40
            }
            Text {
                text: "June"
                font.weight: 500
                font.pixelSize: 20
                color: "#F0C46B"
            }
        }

        Text {
            text: "Today's tasks:"
            font.pixelSize: 20
            z: 1
            Layout.bottomMargin: 20
        }

        Rectangle {
            Layout.minimumWidth: 500
            Layout.minimumHeight: 90
            Layout.preferredHeight: 300
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent

                ListView {
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    verticalLayoutDirection: ListView.BottomToTop
                    spacing: 0
                    model: activeTasksModel
                    delegate: taskComponent
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignBottom
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        spacing: 0

                        Rectangle {
                            id: inputField
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredHeight: 45
                            border.color: "#e6ebed"

                            TextInput {
                                id: input
                                font.pixelSize: 17
                                anchors.fill: parent
                                anchors.topMargin: 11
                                anchors.leftMargin: 15
                                cursorVisible: true
                            }
                        }

                        Rectangle {
                            id: addButton
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredHeight: 45
                            color: mouse.hovered ? "#d2d6d8" : "#e6ebed"

                            HoverHandler {
                                id: mouse
                                acceptedDevices: PointerDevice.Mouse
                                                 || PointerDevice.TouchPad
                                cursorShape: Qt.OpenHandCursor
                            }

                            MouseArea {
                                anchors.fill: parent;
                                onClicked: {
                                    taskModel.addTask(input.text);
                                    input.clear();
                                } 
                            }

                            Text {
                                font.pixelSize: 17
                                text: "+  New Task"
                                color: "#9A9A9B"
                                font.weight: 500
                                anchors.fill: parent
                                anchors.topMargin: 11
                                anchors.leftMargin: 15
                            }
                        }
                    }
                }
            }
        }

        Text {
            text: "Completed tasks:"
            font.pixelSize: 20
            z: 1
            Layout.bottomMargin: 10
        }

        Rectangle {
            Layout.minimumWidth: 500
            Layout.minimumHeight: 90
            Layout.fillWidth: true
            Layout.preferredHeight: 150

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                ListView {
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    clip: true
                    spacing: 0
                    model: completedTasksModel
                    delegate: taskComponent
                }
            }
        }

        Rectangle {
            Layout.minimumHeight: 30
            Layout.minimumWidth: 50
            Layout.preferredHeight: 50
            Layout.preferredWidth: 150
            Layout.alignment: Qt.AlignBottom
            Layout.topMargin: 20
            color: "#e6ebed"
            radius: 30

            Text {
                text: "SAVE"
                font.letterSpacing: 3
                font.pixelSize: 17
                anchors.centerIn: parent
                color: "grey"
                font.weight: 500
            }
        }
    }
}
