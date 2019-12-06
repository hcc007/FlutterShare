
// User Model
class User {
  final String firstName, lastName, website;
  const User(this.firstName, this.lastName, this.website);

  User.fromJson(Map<String, dynamic> json):
        this.firstName = json['first_name'],
        this.lastName = json['last_name'],
        this.website = json['website'];

  Map<String, dynamic> toJson() => {
    "first_name": this.firstName,
    "last_name": this.lastName,
    "website": this.website
  };
}
