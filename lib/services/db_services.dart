import 'package:hive/hive.dart';
import 'package:hive_object_save/models/user_model.dart';

class UserDB {
  var box = Hive.box("user");

  void storeUser(User user) {
    box.put("user", user.toJson());
  }

  User loadUser() {
    User user = User.fromJson(box.get("user"));
    return user;
  }

  void removeUser() async {
    box.delete("user");
  }

}

class AccountDB {
  var box = Hive.box("account");

  void storeAccount(Account account) async {
    box.put("account", account.toJson());
  }

  Account loadAccount() {
    Account account = Account.fromJson(box.get("account"));
    return account;
  }

  void removeAccount() async {
    box.delete("account");
  }

}