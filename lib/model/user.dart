
class UserFields {
  static const String id = "id";
  static const String name = "name";
  static const String email =  "email";
  static const String lastLoggedIn = "last_logged_in";
  static const String registrationDate = "registration_date";
  static const String photoUrl="photo_url";
  static const String buildNumber="build_number";
  static const lastUpdated = "last_updated_date";
  static const String introSeen = "intro_seen";
}

class User {
  String? id;
  // String name;
  String? email;
  // DateTime lastLoggedIn;
  // DateTime registrationDate;
  // String photoUrl;
  // int buildNumber;
  // bool introSeen;

  User(
      {this.id,
        // this.name,
        this.email,
        // this.lastLoggedIn,
        // this.registrationDate,
        // this.photoUrl,
        // this.introSeen,
        // this.buildNumber
     });

  // User.fromDS(String id, Map<String, dynamic> data):
  //       id = id,
  //       name = data[UserFields.name],
  //       email = data[UserFields.email],
  //       lastLoggedIn = data[UserFields.lastLoggedIn]?.toDate(),
  //       registrationDate = data[UserFields.registrationDate]?.toDate(),
  //       photoUrl = data[UserFields.photoUrl],
  //       buildNumber=data[UserFields.buildNumber],
  //       introSeen=data[UserFields.introSeen],
  //       super(id);
  //
  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data[UserFields.id] = id;
  //   data[UserFields.name] = name;
  //   data[UserFields.email] = email;
  //   data[UserFields.lastLoggedIn] = lastLoggedIn;
  //   data[UserFields.registrationDate] = registrationDate;
  //   data[UserFields.photoUrl] = photoUrl;
  //   data[UserFields.buildNumber] = buildNumber;
  //   data[UserFields.introSeen] = introSeen;
  //   return data;
  // }
}