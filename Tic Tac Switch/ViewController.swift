//
//  ViewController.swift
//  Tic Tac Switch
//
//  Created by Rogelio Schevenin on 1/27/19.
//  Copyright © 2019 SDO. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
	@IBOutlet weak var settingsButton: UIButton!
    let urlClickSound    = Bundle.main.url(forResource: "click", withExtension: "mp3")
    let urlPlaceSound    = Bundle.main.url(forResource: "place", withExtension: "mp3")
    let urlGrabSound     = Bundle.main.url(forResource: "grab", withExtension: "mp3")
    let urlRestartSound  = Bundle.main.url(forResource: "restart", withExtension: "mp3")
    let winCombinations  = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var audioPlayerClick: AVAudioPlayer!
    var audioPlayerGrab: AVAudioPlayer!
    var audioPlayerPlace: AVAudioPlayer!
    var audioPlayerRestart: AVAudioPlayer!
    var activePlayer     = 1 //cross
    var crossAmount      = 3 //cross's turns
    var circleAmount     = 3 //circle's turns
    var tileState        = [0,0,0,0,0,0,0,0,0]
    var currentTileState = [6,9,6,9,6,1,3,3,7]
    var gameIsOver = false
    //when tile is clicked
    @IBAction func click(_ sender: AnyObject) {
        restartButton.isEnabled = true
        //player 1
        if (activePlayer == 1 && !gameIsOver){
            //has turns left
            if (crossAmount > 0) {
                //clicks on free tile
                if (tileState[sender.tag-1] == 0) {
                    //change tile to active player
                    tileState[sender.tag-1] = activePlayer
                    //if tile is placed in new location
                    if (currentTileState != tileState){
                        //play sound
                        audioPlayerPlace.stop()
                        audioPlayerPlace.play()
                        //change tile to X
                        sender.setImage(#imageLiteral(resourceName: "x-gold.png"), for: UIControl.State())
                        //subtract a turn
                        crossAmount = crossAmount - 1
                        //next player's turn
                        activePlayer = 2
                        //console
                        print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                        print("Tile's state has changed to: \(tileState[sender.tag-1])")
                        print("Turns left for player \(activePlayer): \(crossAmount)")
                        print("Tile States: \(tileState)")
                    }
                    //else if tile is placed in same location
                    else if (currentTileState == tileState){
                        //play sound
                        audioPlayerPlace.stop()
                        audioPlayerPlace.play()
                        //change tile to X
                        sender.setImage(#imageLiteral(resourceName: "x-gold.png"), for: UIControl.State())
                        //subtract a turn
                        crossAmount = crossAmount - 1
                        //don't change player
                        //activePlayer = 1
                        //console
                        print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                        print("Tile's state has changed to: \(tileState[sender.tag-1])")
                        print("Turns left for player \(activePlayer): \(crossAmount)")
                        print("Tile States: \(tileState)")
                    }
                }
            }
            //has no turns left
            else if (crossAmount == 0) {
                //save tile state
                currentTileState = tileState
                //if tile clicked is player 1's tile
                if (tileState[sender.tag-1] == 1){
                    //play sound
                    audioPlayerGrab.stop()
                    audioPlayerGrab.play()
                    //remove X from tile
                    sender.setImage(nil, for: UIControl.State())
                    //set tile to free
                    tileState[sender.tag-1] = 0
                    //add a turn
                    crossAmount = crossAmount + 1
                    //don't change player
                    //activePlayer = 1
                    //console
                    print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                    print("Tile's state has changed to: \(tileState[sender.tag-1])")
                    print("Turns left for player \(activePlayer): \(crossAmount)")
                    print("Tile States: \(tileState)")
                }
            }
        }
        //player 2
        else if (activePlayer == 2 && !gameIsOver){
            //has turns left
            if (circleAmount > 0) {
                //clicks on free tile
                if (tileState[sender.tag-1] == 0) {
                    //change tile to active player
                    tileState[sender.tag-1] = activePlayer
                    // if tile is placed in new location
                    if (currentTileState != tileState){
                        //play sound
                        audioPlayerPlace.stop()
                        audioPlayerPlace.play()
                        //change tile to O
                        sender.setImage(#imageLiteral(resourceName: "o-blue.png"), for: UIControl.State())
                        //subtract a turn
                        circleAmount = circleAmount - 1
                        //next player's turn
                        activePlayer = 1
                        //console
                        print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                        print("Tile's state has changed to: \(tileState[sender.tag-1])")
                        print("Turns left for player \(activePlayer): \(crossAmount)")
                        print("Tile States: \(tileState)")
                    }
                    //else if tile is placed in same location
                    else if (currentTileState == tileState){
                        //play sound
                        audioPlayerPlace.stop()
                        audioPlayerPlace.play()
                        //set tile to O
                        sender.setImage(#imageLiteral(resourceName: "o-blue.png"), for: UIControl.State())
                        //subtract a turn
                        circleAmount = circleAmount - 1
                        //don't change player
                        //activePlayer = 2
                        //console
                        print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                        print("Tile's state has changed to: \(tileState[sender.tag-1])")
                        print("Turns left for player \(activePlayer): \(crossAmount)")
                        print("Tile States: \(tileState)")
                    }
                }
            }
            //has no turns left
            else if (circleAmount == 0) {
                //save tile state
                currentTileState = tileState
                //if tile clicked is player 2's tile
                if (tileState[sender.tag-1] == 2){
                    //play sound
                    audioPlayerGrab.stop()
                    audioPlayerGrab.play()
                    //remove O from tile
                    sender.setImage(nil, for: UIControl.State())
                    //set tile to free
                    tileState[sender.tag-1] = 0
                    //add a turn
                    circleAmount = circleAmount + 1
                    //don't change player
                    //activePlayer = 2
                    //console
                    print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                    print("Tile's state has changed to: \(tileState[sender.tag-1])")
                    print("Turns left for player \(activePlayer): \(crossAmount)")
                    print("Tile States: \(tileState)")
                }
            }
        }
        //winning
        for combination in winCombinations {
            if tileState[combination[0]] != 0 && tileState[combination[0]] == tileState[combination[1]] && tileState[combination[1]] == tileState[combination[2]] {
                gameIsOver = true
                if (tileState[combination[0]] == 1) {
                    self.topImage.image = #imageLiteral(resourceName: "win-cross.png")
                    restartButton.isEnabled = true
                    // sound is kind of annoying AudioServicesPlaySystemSound(SystemSoundID(1336))
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    //cross has won
                    //console
                    print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                    print("Tile's state has changed to: \(tileState[sender.tag-1])")
                    print("Turns left for player \(activePlayer): \(crossAmount)")
                    print("Tile States: \(tileState)")
                    print("CROSS WON")
                }
                else {
                    self.topImage.image = #imageLiteral(resourceName: "win-circle.png")
                    restartButton.isEnabled = true
                    // sound is kind of annoying AudioServicesPlaySystemSound(SystemSoundID(1336))
                    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                    //circle has won
                    //console
                    print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+")
                    print("Tile's state has changed to: \(tileState[sender.tag-1])")
                    print("Turns left for player \(activePlayer): \(crossAmount)")
                    print("Tile States: \(tileState)")
                    print("CIRCLE WON" )
                }
                
            }
        }
    }
    //when restartButton is clicked
    @IBAction func restartGame(_ sender: AnyObject) {
        audioPlayerRestart.play()
        gameIsOver = false
        restartButton.isEnabled = false
        activePlayer = 1 //cross
        crossAmount = 3 //cross turns
        circleAmount = 3 //circle turns
        tileState = [0,0,0,0,0,0,0,0,0] //set all tiles to free
        currentTileState = [1,2,3,4,5,6,7,8,9]
        AudioServicesDisposeSystemSoundID(1336)
        //resets images
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
            }
        self.topImage.image = #imageLiteral(resourceName: "tictacswitch")
	}
	//when settingsButton is clicked
    @IBAction func showSettings(_ sender: Any){
        audioPlayerClick.stop()
        audioPlayerClick.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isEnabled = false
        view.addBackground(imageName: "background.jpg")
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayerClick = try AVAudioPlayer(contentsOf: urlClickSound!)
            audioPlayerClick.prepareToPlay()
        }catch let error as NSError {
            print(error.debugDescription)
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayerPlace = try AVAudioPlayer(contentsOf: urlPlaceSound!)
            audioPlayerPlace.prepareToPlay()
        }catch let error as NSError {
            print(error.debugDescription)
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayerGrab = try AVAudioPlayer(contentsOf: urlGrabSound!)
            audioPlayerGrab.prepareToPlay()
        }catch let error as NSError {
            print(error.debugDescription)
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayerRestart = try AVAudioPlayer(contentsOf: urlRestartSound!)
            audioPlayerRestart.prepareToPlay()
        }catch let error as NSError {
            print(error.debugDescription)
        }
    }
}
