import 'package:get/get.dart';
import 'package:new_techblog/screens/podcast_list/podcast_list_screen_controller.dart';

class PodcastListScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PodcastListScreenController());
  }
}
