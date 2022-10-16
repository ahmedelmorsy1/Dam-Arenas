class ArenaModel{
  String? name, price;
   bool? wired ,fivePm,sixPm,sevenPm;

  ArenaModel(this.fivePm, this.sixPm, this.sevenPm, {this.name, this.price , this.wired});

  ArenaModel.fromJson(Map<dynamic,dynamic> arenaMap){
    name = arenaMap['name'];
    price = arenaMap['price'];
    wired = arenaMap['wired'];
    fivePm =arenaMap['5:00 - 6:00 pm'];
    sixPm =arenaMap['6:00 - 7:00 pm'];
    sevenPm =arenaMap['7:00 - 8:00 pm'];
  }

  toJson(){
    return{
      'name':name,
      'price':price,
      'wired':wired,
      '5:00 - 6:00 pm':fivePm,
      '6:00 - 7:00 pm':sixPm,
      '7:00 - 8:00 pm':sevenPm,
    };
  }
}