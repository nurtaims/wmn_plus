class RegistrationModel {
  String firstname;
  String surname;
  String password;
  String phone;
  String dateOfBirth;
  Fertility fertility;
  Pregnancy pregnancy;

  RegistrationModel(
      {this.firstname,
      this.surname,
      this.password,
      this.phone,
      this.dateOfBirth,
      this.fertility,
      this.pregnancy});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    surname = json['surname'];
    password = json['password'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    fertility = json['fertility'] != null
        ? new Fertility.fromJson(json['fertility'])
        : null;
    pregnancy = json['pregnancy'] != null 
    ? new Pregnancy.fromJson(json['pregnancy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['surname'] = this.surname;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['pregnancy'] = this.pregnancy;
    data['dateOfBirth'] = this.dateOfBirth;
    if (this.fertility != null) {
      data['fertility'] = this.fertility.toJson();
    }
    if (this.pregnancy != null) {
      data['pregnancy'] = this.pregnancy.toJson();
    }
    return data;
  }
}

class Fertility {
  String start;
  int duration;
  int period;

  Fertility({this.start, this.duration, this.period});

  Fertility.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    duration = json['duration'];
    period = json['period'];
  }

  set startTime(String s) => start = s;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['duration'] = this.duration;
    data['period'] = this.period;
    return data;
  }
}
class Pregnancy {
  int week;

  Pregnancy({this.week});

  Pregnancy.fromJson(Map<String, dynamic> json) {
    week = json['week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week'] = this.week;
    return data;
  }
}
