class DataStoredModel {
  late final int id;
  late final String name;
  late final String deathName;
  late final String provasiName;
  late final String gender;
  late final String destination;
  late final String designation;
  late final String company;

  DataStoredModel(this.id, {required this.name, required this.deathName, required this.provasiName, required this.gender, required this.destination, required this.designation, required this.company});

  int get getId => id;
  String get getName => name;
  String get getDeathNme => deathName;
  String get getProvasiName => provasiName;
  String get getGender => gender;
  String get getDestination => destination;
  String get getDesignation => designation;
  String get getCompany => company;

  set setName(String name){
    this.name= name;
  }
  set setDeathName(String deathName){
    this.deathName= deathName;
  }
  set setProvasiName(String provasiName){
    this.provasiName= provasiName;
  }
  set setGender(String gender){
    this.gender= gender;
  }set setDestination(String destination){
    this.destination= destination;
  }
  set setDesignation(String designation){
    this.designation= designation;
  }
  set setCompany(String company){
    this.company= company;
  }
  // convert map
  Map<String, dynamic> toMap(){
    var map= <String, dynamic>{};
    map['id']= id;
    map['name']= name;
    map['deathName']= deathName;
    map['provasiName']= provasiName;
    map['gender']= gender;
    map['destination']= destination;
    map['designation']= designation;
    map['company']= company;
    return map;
  }

  DataStoredModel.fromMapToObject(Map<String, dynamic> map){
    this.id= map['id'];
    this.name= map['name'];
    this.deathName= map['deathName'];
    this.provasiName= map['provasiName'];
    this.gender= map['gender'];
    this.destination= map['destination'];
    this.designation= map['designation'];
    this.company= map['company'];
  }



}