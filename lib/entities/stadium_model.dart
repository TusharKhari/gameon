
class StadiumModel {
  String ? id;
  String ? name;
  String ? pitchType;
  String ? imageUrl;
  List<TwentyOver> ? twentyOver;
  List<ThirtyOver> ? thirtyOver;
  List<StadiumLocation> ? stadiumLocation;

  StadiumModel({ this.id, this.name, this.pitchType, this.imageUrl,  this.twentyOver, this.thirtyOver,  this.stadiumLocation});

  StadiumModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["pitchType"] is String) {
      pitchType = json["pitchType"];
    }
    if(json["imageUrl"] is String) {
      imageUrl = json["imageUrl"];
    }
    if(json["twentyOver"] is List) {
      twentyOver = json["twentyOver"]==null ? null : (json["twentyOver"] as List).map((e)=>TwentyOver.fromJson(e)).toList();
    }
    if(json["thirtyOver"] is List) {
      thirtyOver = json["thirtyOver"]==null ? null : (json["thirtyOver"] as List).map((e)=>ThirtyOver.fromJson(e)).toList();
    }
    if(json["stadiumLocation"] is List) {
      stadiumLocation = json["stadiumLocation"]==null ? null : (json["stadiumLocation"] as List).map((e)=>StadiumLocation.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["pitchType"] = pitchType;
    data["imageUrl"] = imageUrl;
    if(twentyOver != null) {
      data["twentyOver"] = twentyOver?.map((e)=>e.toJson()).toList();
    }
    if(thirtyOver != null) {
      data["thirtyOver"] = thirtyOver?.map((e)=>e.toJson()).toList();
    }
    if(stadiumLocation != null) {
      data["stadiumLocation"] = stadiumLocation?.map((e)=>e.toJson()).toList();
    }
    return data;
  }
}

class StadiumLocation {
  String ? state;
  String ? country;
  String ? city ;

  StadiumLocation({ this.state,  this.country, this.city});

  StadiumLocation.fromJson(Map<String, dynamic> json) {
    if(json["state"] is String) {
      state = json["state"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["city"] is String) {
      country = json["city"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["state"] = state;
    data["country"] = country; data["city"] = city;
    return data;
  }
}

class ThirtyOver {
  String ? time;

  ThirtyOver({this.time});

  ThirtyOver.fromJson(Map<String, dynamic> json) {
    if(json["time"] is String) {
      time = json["time"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["time"] = time;
    return data;
  }
}

class TwentyOver {
  String ? time;

  TwentyOver({this.time});

  TwentyOver.fromJson(Map<String, dynamic> json) {
    if(json["time"] is String) {
      time = json["time"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["time"] = time;
    return data;
  }
}