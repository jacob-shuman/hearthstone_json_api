import "dart:convert";

class HearthstoneJsonApiCard {
  final String id;
  final int dbfId;
  final String name;
  final String text;
  final String flavor;
  final String artist;
  final int attack;
  final String cardClass;
  final bool collectible;
  final int cost;
  final bool elite;
  final String faction;
  final int health;
  final List<String> mechanics;
  final String rarity;
  final String set;
  final String type;

  HearthstoneJsonApiCard({
    this.id,
    this.dbfId,
    this.name,
    this.text,
    this.flavor,
    this.artist,
    this.attack,
    this.cardClass,
    this.collectible,
    this.cost,
    this.elite,
    this.faction,
    this.health,
    this.mechanics,
    this.rarity,
    this.set,
    this.type,
  });

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "dbfId": this.dbfId,
        "name": this.name,
        "text": this.text,
        "flavor": this.flavor,
        "artist": this.artist,
        "attack": this.attack,
        "cardClass": this.cardClass,
        "collectible": this.collectible,
        "cost": this.cost,
        "elite": this.elite,
        "faction": this.faction,
        "health": this.health,
        "mechanics": this.mechanics,
        "rarity": this.rarity,
        "set": this.set,
        "type": this.type,
      };
}
