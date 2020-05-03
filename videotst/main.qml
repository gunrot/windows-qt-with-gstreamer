import QtQuick 2.13
import QtMultimedia 5.13
import QtQuick.Controls 2.13

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    Video {
        id: video

        anchors.fill: parent
        source: "rtsp://170.93.143.139/rtplive/470011e600ef003a004ee33696235daa"
       
        MouseArea {
            anchors.fill: parent
            onClicked: {
                video.play()
            }
        }
        autoPlay: true
        focus: true
        Keys.onSpacePressed: video.playbackState
                             == MediaPlayer.PlayingState ? video.pause(
                                                               ) : video.play()
        Keys.onLeftPressed: video.seek(video.position - 5000)
        Keys.onRightPressed: video.seek(video.position + 5000)
        onErrorStringChanged: {
            console.log("Error:" + errorString)
        }
        onErrorChanged: {
            console.log("ErrorCode:" + error.toString())
        }
        onAvailabilityChanged: {
            console.log("availability:" + availability.toString())
        }

        onBufferProgressChanged: {
            console.log("bufferProgress:" + bufferProgress)
        }
        onPositionChanged: {
            console.log("position:" + position)
        }
    }
}
