
let player1: [String : String] = [
    "name": "Joe Smith",
    "height": "42",
    "experience": "YES",
    "guardians": "Jim and Jan Smith"]

let player2: [String : String] = [
    "name": "Jill Tanner",
    "height": "36",
    "experience": "YES",
    "guardians": "Clara Tanner"]

let player3: [String : String] = [
    "name": "Bill Bon",
    "height": "43",
    "experience": "YES",
    "guardians": "Sara and Jenny Bon"]

let player4: [String : String] = [
    "name": "Eva Gordon",
    "height": "45",
    "experience": "NO",
    "guardians": "Wendy and Mike Gordon"]

let player5: [String : String] = [
    "name": "Matt Gill",
    "height": "40",
    "experience": "NO",
    "guardians": "Charles and Sylvia Gill"]

let player6: [String : String] = [
    "name": "Kimmy Stein",
    "height": "41",
    "experience": "NO",
    "guardians": "Bill and Hillary Stein"]

let player7: [String : String] = [
    "name": "Sammy Adams",
    "height": "45",
    "experience": "NO",
    "guardians": "Jeff Adams"]

let player8: [String : String] = [
    "name": "Karl Saygan",
    "height": "42",
    "experience": "YES",
    "guardians": "Heather Bledsoe"]

let player9: [String : String] = [
    "name": "Suzane Greenberg",
    "height": "44",
    "experience": "YES",
    "guardians": "Henrietta Dumas"]

let player10: [String : String] = [
    "name": "Sal Dali",
    "height": "41",
    "experience": "NO",
    "guardians": "Gala Dali"]

let player11: [String : String] = [
    "name": "Joe Kavalier",
    "height": "39",
    "experience": "NO",
    "guardians": "Sam and Elaine Kavalier"]

let player12: [String : String] = [
    "name": "Ben Finkelstein",
    "height": "44",
    "experience": "NO",
    "guardians": "Aaron and Jill Finkelstein"]

let player13: [String : String] = [
    "name": "Diego Soto",
    "height": "41",
    "experience": "YES",
    "guardians": "Robin and Sarika Soto"]

let player14: [String : String] = [
    "name": "Chloe Alaska",
    "height": "47",
    "experience": "NO",
    "guardians": "David and Jamie Alaska"]

let player15: [String : String] = [
    "name": "Arnold Willis",
    "height": "43",
    "experience": "NO",
    "guardians": "Claire Willis"]

let player16: [String : String] = [
    "name": "Phillip Helm",
    "height": "44",
    "experience": "YES",
    "guardians": "Thomas Helm and Eva Jones"]

let player17: [String : String] = [
    "name": "Les Clay",
    "height": "42",
    "experience": "YES",
    "guardians": "Wynonna Brown"]

let player18: [String : String] = [
    "name": "Herschel Krustofski",
    "height": "45",
    "experience": "YES",
    "guardians": "Hyman and Rachel Krustofski"]

var players = [player1, player2, player3, player4, player5, player6
    , player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]


var experiencedPlayers = [[String : String]]()
var inexperiencedPlayers = [[String : String]]()

var teamSharks = [[String : String]]()
var teamDragons = [[String : String]]()
var teamRaptors = [[String : String]]()


var theLeague = [teamSharks, teamDragons, teamRaptors]

for player in players {
    
    if player["experience"] == "YES" {
        // i found "as?" by chance which lets us cast an object as another type of object, not sure if this is admissible but I didn't know what else to use since I wanted to have my "height" in the players' settings as an actual number not a string. Any input here would be much appreciated
        experiencedPlayers.append(player)
    } else {
        inexperiencedPlayers.append(player)
    }
    
}


inexperiencedPlayers.count
experiencedPlayers.count

// this way we are creating a certain limit with maxExperienced (which would work for any number of teams and players too
for player in experiencedPlayers {
    let maxExperienced = (experiencedPlayers.count/theLeague.count)
    if teamSharks.count < maxExperienced {
        teamSharks.append(player)
    } else if teamDragons.count < maxExperienced {
        teamDragons.append(player)
    } else if teamRaptors.count < maxExperienced {
        teamRaptors.append(player)
    }
}
teamSharks.count
players.count
for player in inexperiencedPlayers {
    if teamSharks.count < (players.count/theLeague.count) {
        teamSharks.append(player)
    } else if teamDragons.count < players.count/theLeague.count {
        teamDragons.append(player)
    } else if teamRaptors.count < players.count/theLeague.count {
        teamRaptors.append(player)
    }
}



teamRaptors.count
teamSharks.count
teamDragons.count
let dragonsName = "Dragons"
let sharksName = "Sharks"
let raptorsName = "Raptors"

/*
 
 Dragons - March 17, 1pm
 Sharks - March 17, 3pm
 Raptors - March 18, 1pm
 
 */
var dragonsTime = "March 17, 1pm"
var raptorsTime = "March 18, 1pm"
var sharksTime = "March 17, 3pm"


var letters = [String]()


for player in teamDragons {
    if let guardians = player["guardians"], let name = player["name"]{
        let theLetter = "Hello \(guardians), \(name) has made his first transfer to \(dragonsName). The first practice of the team starts on \(dragonsTime)"
        letters.append(theLetter)
    }
}

for player in teamRaptors {
    if let guardians = player["guardians"], let name = player["name"]{
        let theLetter = "Hello \(guardians), \(name) has made his first transfer to \(raptorsName). The first practice of the team starts on \(raptorsTime)"
        letters.append(theLetter)
    }
}

for player in teamSharks {
    if let guardians = player["guardians"], let name = player["name"]{
        let theLetter = "Hello \(guardians), \(name) has made his first transfer to \(sharksName). The first practice of the team starts on \(sharksTime)"
        letters.append(theLetter)
    }
}

for letter in letters {
    print(letter)
}




