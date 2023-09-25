import 'dart:convert';

import 'package:get/get.dart';
import 'package:hilfedienst/controller/auth_controller.dart';
import 'package:hilfedienst/data/models/user_info.dart';

class ProfileController extends GetxController with StateMixin<UserInfo> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getUserInfo();
  }

  void getUserInfo() async {
    var profileResponse = await AuthController.profileController();
    if (profileResponse.statusCode == 200) {
      Map<String, dynamic> profileData = jsonDecode(profileResponse.body);
      // var profile = UserInfo.fromJson(jsonDecode(profileData.body)['userinfo']);
      var profile = UserInfo.fromJson(profileData['userinfo']);
      change(profile, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error("Error"));
    }
  }
}
