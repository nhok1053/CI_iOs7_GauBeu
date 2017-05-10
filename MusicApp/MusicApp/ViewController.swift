//
//  ViewController.swift
//  MusicApp
//
//  Created by Admin on 5/10/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var endTime: UILabel!
    @IBOutlet var startTime: UILabel!
    @IBOutlet var TrackSlider: UISlider!
    @IBOutlet var lblSongName: UILabel!
    @IBOutlet var backButton: UIImageView!
    @IBOutlet var nextButton: UIImageView!
    @IBOutlet var playButton: UIImageView!
    @IBOutlet var vollumeSlider: UISlider!
    
    var songs : [String] = []
    var audioPlayer =  AVAudioPlayer()
    var indexOfSong = 0
    var songCurrentTime  = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       // UIApplication.shared.beginReceivingRemoteControlEvents()
       
        playButton.isUserInteractionEnabled = true
        nextButton.isUserInteractionEnabled = true
        backButton.isUserInteractionEnabled = true
        TrackSlider.isUserInteractionEnabled = true
        gettingSongName()
        print(songs)
        playSong()
       // TrackSlider.maximumValue = Float(audioPlayer.duration)
        var time = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: Selector("updateSlider"), userInfo: nil, repeats: true)
        
         var time2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("checkNextSong"), userInfo: nil, repeats: true)

     //  print("Current Time :  \(self.audioPlayer.duration)")
        
    }
    
    func playSong() {
        do{
            print(indexOfSong)
            let audioPath = Bundle.main.path(forResource: songs[indexOfSong], ofType: ".mp3")
            lblSongName.text = songs[indexOfSong]
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
            let songTime = Int(self.audioPlayer.duration) + 1
            TrackSlider.maximumValue = Float(audioPlayer.duration)
            print("Current Time : \(songTime)")
            
        }catch{
            print("ERROR")
            
        }

    }
    func changTime(time : Int) -> String {
        var timeString : String = " "
        let minutes : Int = time / 60;
        let seconds : Int = time % 60;
        if seconds < 10 {
              timeString = "0\(minutes):0\(seconds)"
        } else {
              timeString = "0\(minutes):\(seconds)"
        }
        return timeString
    }
    
    func timeDuration(){
        let songTime = Int(self.audioPlayer.duration) + 1
        endTime.text = changTime(time: songTime)
        startTime.text = changTime(time: Int(TrackSlider.value))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            //MARK : playButton
            if touch.view == self.playButton {
                if(audioPlayer.isPlaying){
                    audioPlayer.pause()
                    playButton.image = UIImage(named: "play-button")
                }else {
                     playButton.image = UIImage(named: "pause")
                    audioPlayer.play()
                }
            }
            //MARK : nextButton
            if touch.view == self.nextButton {
                nextSong()
            }
            //MARK : backButton
            if touch.view == self.backButton {
               backSong()
            }
        }
    }
    
    func nextSong()  {
        if indexOfSong == songs.count - 1 {
            indexOfSong = 0
        }else{
            indexOfSong += 1
        }
        playSong()

    }
    func backSong()  {
        
        if indexOfSong == 0 {
            indexOfSong = songs.count - 1
        }else{
            indexOfSong -= 1
        }
        playSong()
    }
    func gettingSongName()  {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        do{
            let songPath = try FileManager.default.contentsOfDirectory(at : folderURL ,includingPropertiesForKeys  : nil , options : .skipsHiddenFiles )
            for song in songPath {
                var mySong  = song.absoluteString
                
                if mySong.contains(".mp3"){
                    let findString  = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count - 1]
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    songs.append(mySong)
                    
                }
            }
        }
        catch{
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func changeAudioVolume(_ sender: Any) {
        audioPlayer.volume = vollumeSlider.value 
        print("Volume :\(vollumeSlider.value )")
       
    }
    @IBAction func changeAudioTime(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(TrackSlider.value)
        audioPlayer.prepareToPlay()
        playButton.image = UIImage(named: "pause")
        audioPlayer.play()
    }
    func updateSlider()  {
        TrackSlider.value = Float(audioPlayer.currentTime)
        
    }
    func checkNextSong()  {
        timeDuration()

        print("\(TrackSlider.value) + \(Float(audioPlayer.duration))")
        if( Int(TrackSlider.value) ==  Int(audioPlayer.duration)){
            nextSong()
        }

    }

}

