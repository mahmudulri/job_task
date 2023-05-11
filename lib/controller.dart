import 'package:get/get.dart';
import 'package:job_task/model.dart';

import 'network.dart';

class PostController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getallPost();
  }

  var isloading = false.obs;

  var allpost = <Product>[].obs;

  void getallPost() async {
    try {
      isloading(true);
      var allnewfinalpost = await ContentApi.getNewPost();
      if (allnewfinalpost != null) {
        allpost.assignAll(allnewfinalpost);
      }

      print(allpost);
    } finally {
      isloading(false);
    }
  }
}
