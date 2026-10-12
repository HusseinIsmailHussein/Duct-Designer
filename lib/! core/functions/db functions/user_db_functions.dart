import 'package:get_storage/get_storage.dart';

import '../../model/user_model.dart';

class UserDatabaseHelper {
  var storage = GetStorage();

  addUser(UserModel userModel) async {
    await storage.write('user', userModel.toJson());
  }

  getUser() {
    return storage.read('user');
  }
}
