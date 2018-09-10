/* ######################################################
                    Einsendeaufgabe 4
 ###################################################### */

//
//  main.swift
//  OBJC04A-Einsendearbeit
//
//  Created by Magnus Kruschwitz on 09.09.18.
//  Copyright © 2018 Magnus Kruschwitz. All rights reserved.
//

import Foundation

struct sKiste {
    var name         = ""
    var width        = 0.00
    var height       = 0.00
    var length       = 0.00
    var lastModified = 0.00
    
    func getVol() -> Double{
        return width * height * length
    }
}

var aKInLager = [sKiste]()
var bOuterRuntime = true
var iCounter = 0

func appendItem(){
    let name = "Kiste \(iCounter)"
    print("Bitte geben Sie für \(name) eine Breite an")
    let width = Double(readLine()!)!
    print("Bitte geben Sie für \(name) eine Höhe an")
    let height = Double(readLine()!)!
    print("Bitte geben Sie für \(name) eine Länge an")
    let length = Double(readLine()!)!
    aKInLager.append(sKiste(name: name, width: width, height: height, length: length, lastModified: NSDate().timeIntervalSince1970))
    print("\(name) wurde erfolgreich hinzugefügt!")
    iCounter += 1
}

func getItemIndexVolume(){
    if(aKInLager.count > 0){
        print("Bitte geben Sie den Index an, von dem das Volumen berechnet werden soll:")
        let iPos = Int(readLine()!)!
        if(aKInLager.indices.contains(iPos)){
            print("Das Volumen von \(aKInLager[iPos].name) lautet \(aKInLager[iPos].getVol())")
        }
        else{
            print("Der angegegebene Index ist nicht vorhanden, bitte wählen Sie eine andere Funktion!")
        }
    }
    else{
        print("Abbruch, da es keine Items gibt.")
    }
}

func showItemIndex(){
    if(aKInLager.count > 0){
        print("Bitte geben Sie den Index der Kiste an, die Sie angezeigt haben möchten:")
        let iPos = Int(readLine()!)!
        if(aKInLager.indices.contains(iPos)){
            print(aKInLager[iPos])
        }
        else{
            print("Der angegegebene Index ist nicht vorhanden, bitte wählen Sie eine andere Funktion!")
        }
    }
    else{
        print("Abbruch, da es keine Items gibt.")
    }
}

func showAllItems(){
    if(aKInLager.count > 0){
        for (index, value) in aKInLager.enumerated(){
            print("Das Element an der Position \(index) lautet: \(value)")
        }
    }
    else{
        print("Abbruch, da es keine Items gibt.")
    }
}

func removeItemIndex(){
    if(aKInLager.count > 0){
        print("Bitte geben Sie den Index der Kiste an, die Sie löschen möchten:")
        let iPos = Int(readLine()!)!
        if(aKInLager.indices.contains(iPos)){
            aKInLager.remove(at: iPos)
            print("Die Kiste an der Position \(iPos) wurde erfolgreich gelöscht.")
        }
    }
    else{
        print("Abbruch, da es keine Items gibt.")
    }
}

func changeItemIndex(){
    if(aKInLager.count > 0){
        print("Bitte geben Sie den Index der Kiste an, die Sie angezeigt haben möchten:")
        let iPos = Int(readLine()!)!
        if(aKInLager.indices.contains(iPos)){
            var iChanges = 0
            print("Möchten Sie \(aKInLager[iPos].name) einen individuellen Namen geben? Wenn ja, drücken Sie bitte 1, wenn Nein, dann bitte 0.")
            if(Int(readLine()!)! == 1){
                print("Bitte geben Sie einen Namen ein:")
                aKInLager[iPos].name = readLine()!
                iChanges += 1
            }
            print("Möchten Sie \(aKInLager[iPos].name) einen neue Breite geben? Wenn ja, drücken Sie bitte 1, wenn Nein, dann bitte 0.")
            if(Int(readLine()!)! == 1){
                print("Bitte geben Sie eine neue Breite ein:")
                aKInLager[iPos].width = Double(readLine()!)!
                iChanges += 1
            }
            print("Möchten Sie \(aKInLager[iPos].name) einen neue Höhe geben? Wenn ja, drücken Sie bitte 1, wenn Nein, dann bitte 0.")
            if(Int(readLine()!)! == 1){
                print("Bitte geben Sie eine neue Höhe ein:")
                aKInLager[iPos].height = Double(readLine()!)!
                iChanges += 1
            }
            print("Möchten Sie \(aKInLager[iPos].name) einen neue Länge geben? Wenn ja, drücken Sie bitte 1, wenn Nein, dann bitte 0.")
            if(Int(readLine()!)! == 1){
                print("Bitte geben Sie eine neue Länge ein:")
                aKInLager[iPos].length = Double(readLine()!)!
                iChanges += 1
            }
            if(iChanges > 0){
                aKInLager[iPos].lastModified = NSDate().timeIntervalSince1970
            }
        }
        else{
            print("Der angegegebene Index ist nicht vorhanden, bitte wählen Sie eine andere Funktion!")
        }
    }
    else{
        print("Abbruch, da es keine Items gibt.")
    }
}

while(bOuterRuntime){
    print("Möchten Sie das Program beenden? Wenn ja, dann drücken Sie bitte jetzt 1, ansonsten 0 zum weitermachen!")
    if(Int(readLine()!)! == 1){
        bOuterRuntime = false
        var sContent = ""
        if(aKInLager.count == 1){
            sContent = "Inhalt wird"
        }
        else{
            sContent = "Inhalte werden"
        }
        print("Programm wird beendet! \(aKInLager.count) \(sContent) undwiderruflich gelöscht.")
    }
    else{
        var bInnerRunetime = true
        
        while(bInnerRunetime){
            print("Was möchten Sie tun? Folgende Möglichkeiten stehen Ihnen zur Verfügung:\n1 zum Anlegen einer neuen Kiste,\n2 zum löschen einer vorhandenen Kiste über einen Index,\n3 zum Ändern von Daten einer vorhandenen Kiste,\n4 zum Anzeigen der Daten einer Kiste per Index,\n5 zum Auflisten aller vorhandenen Kisten,\n6 um das Volumen eines Indexes auszugeben,\n0 um abzubrechen und ins Hauptmenü zu gelangen!\nBitte treffen Sie eine Entscheidung!")
            
            switch(Int(readLine()!)!){
                case 1:
                    appendItem()
                    break
                case 2:
                    removeItemIndex()
                    break
                case 3:
                    changeItemIndex()
                    break
                case 4:
                    showItemIndex()
                    break
                case 5:
                    showAllItems()
                    break
                case 6:
                    getItemIndexVolume()
                    break
                case 0:
                    print("Sie gelangen nun ins Hauptmenü zurück!")
                    bInnerRunetime = false
                    break
                default :
                    print("Eingabe konnte nicht verarbeitet werden!")
                    break
            }
        }
        
    }
}
