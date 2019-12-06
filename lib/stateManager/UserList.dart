// User List Model
import 'User.dart';

class UserList {
  final List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson) :
        users = usersJson.map((user) => User.fromJson(user)).toList();
}