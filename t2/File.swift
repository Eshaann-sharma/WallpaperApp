//
//  File.swift
//  t2
//
//  Created by Eshaan Sharma on 10/06/23.
//
import SwiftUI


struct Wallpapers : Identifiable {
    let id = UUID()
    let wallpaperName : String
    let category : String
    let imgName : String
    let url : URL
    
}

enum Tab: String,CaseIterable{
    case home = "house"
    case search = "magnifyingglass"
    case fav = "heart"
}

struct WallpaperList {
    static let Top = [
        Wallpapers(wallpaperName: "Red Beauty",
                   category: "Anime",
                   imgName:"a" ,
                   url: URL(string:"https://www.wallpaperflare.com/digital-digital-art-artwork-illustration-drawing-digital-painting-wallpaper-gjrrx" )!),
        
        Wallpapers(wallpaperName: "Miles Moralis",
                   category: "Spiderman",
                   imgName:"b" ,
                   url: URL(string: "https://www.wallpaperflare.com/spiderman-into-the-spider-verse-2018-movies-animated-movies-wallpaper-pdbuq/download" )!),
        
        Wallpapers(wallpaperName: "Purple Eyes",
                   category: "Anime",
                   imgName:"c" ,
                   url: URL(string:"https://www.wallpaperflare.com/women-dark-hair-purple-eyes-kimono-anime-girls-artwork-wallpaper-cuuah/download")!),
        
        Wallpapers(wallpaperName: "Sniper",
                   category: "CyberPunk",
                   imgName:"d" ,
                   url: URL(string:"https://www.wallpaperflare.com/cyberpunk-artwork-sniper-rifle-anime-girls-music-arts-culture-and-entertainment-wallpaper-psyoo")!),
        
        Wallpapers(wallpaperName: "Chill Spiderman",
                   category: "Spiderman",
                   imgName: "e",
                   url:URL(string:"https://www.wallpaperflare.com/spiderman-4k-artwork-hd-artist-behance-superheroes-digital-art-wallpaper-bdqxt/download")!),
        
        Wallpapers(wallpaperName: "Focus", category: "Motivation", imgName: "f", url: URL(string: "https://www.wallpaperflare.com/focus-text-screenshot-focus-on-what-s-important-text-with-red-and-blue-bokeh-light-background-wallpaper-myodq/download")!),
        
        Wallpapers(wallpaperName: "Samurai", category: "Samurai", imgName: "g", url: URL(string: "https://www.wallpaperflare.com/the-sun-minimalism-japan-sword-warrior-samurai-art-katana-wallpaper-godzc/download")!),
        
        Wallpapers(wallpaperName: "Messi", category: "Football", imgName: "h", url: URL(string: "https://www.wallpaperflare.com/lionel-messi-football-barcelona-wallpaper-gjeat/download")!)
        
    ]
}
