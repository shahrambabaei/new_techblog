import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:new_techblog/screens/podcast_list/podcast_list_screen_controller.dart';
import 'package:new_techblog/widgets/my_appbar.dart';
import 'package:new_techblog/widgets/my_color.dart';

class PodcastListScreen extends GetView<PodcastListScreenController> {
  final String title;
  const PodcastListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return SizedBox(
                height: Get.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitFadingCircle(
                        color: SolidColors.primaryColor,
                        size: 32,
                      ),
                      SizedBox(height: 16),
                      Text('در حال بارگذاری...'),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Text('Podcast List Screen'),
            );
          },
        ),
      ),
    );
  }
}
