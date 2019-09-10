import UIKit

// Target protocol 1
protocol Player {
    func play(audioType: String, fileName: String)
}

// Target protocol 2

//TODO: Implement a Pause protocol with a pause() function that accepts 1 parameter: A String called "fileName"
protocol Pause {
    func pause(fileName: String)
}


// Adaptee 1
class AudioPlayer {
    func playAudio(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adaptee 2
class VideoPlayer {
    func playVideo(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adapter (class)
class MyPlayer: Player {
    
    //TODO: create required player variables
    let videoPlayer = VideoPlayer()
    let audioPlayer = AudioPlayer()
    
    func play(audioType: String, fileName: String) {
        if (audioType == ".mp4"){
            videoPlayer.playVideo(fileName: fileName);
        }else if(audioType == ".aac"){
            audioPlayer.playAudio(fileName: fileName);
        }
    }
}

// Adapter (class extension)
extension MyPlayer: Pause {
    func pause(fileName: String) {
        print("\(fileName) is now paused...")
    }
    
    //TODO: Implement a class extension which adds Pause functionality to MyPlayer
    
    
}

// Usage
let myPlayer = MyPlayer()
myPlayer.play(audioType: ".aac", fileName: "Titanium.aac")
myPlayer.play(audioType: ".mp4", fileName: "Cat_riding_a_roomba.mp4")
myPlayer.pause(fileName: "Cat_riding_a_roomba.mp4")


/* This should print:
 Now Playing:  Titanium.aac
 Now Playing:  Cat_riding_a_roomba.mp4
 Cat_riding_a_roomba.mp4  is now paused...
 */
