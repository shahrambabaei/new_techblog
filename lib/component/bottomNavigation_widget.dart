import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/storage_constant.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:new_techblog/routes/app_pages.dart';
import 'package:new_techblog/routes/app_routes.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onChange;

  const BottomNavigation({
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: GradientColors.bottomNav),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => onChange(0),
              icon: ImageIcon(
                Assets.icons.user.image().image,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                // GetStorage().read(StorageConstant.token) == null
                //     ? onChange(1)
                //     :
                Get.bottomSheet(
                  Container(
                    padding: EdgeInsets.all(30),
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                Assets.images.techbot,
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                    "دونسته هات رو با بقیه به اشتراک بذار ..."),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "فکر کن!! اینجا بودنت به این معناست که یک گیک تکنولوژی هستی دونسته هات رو با جامعه ی گیک های فارسی زبان به اشتراک بگذار"),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.manageArticleScreen);
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Assets.icons.articleIcon.path,
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("مدیریت مقاله ها")
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Assets.icons.podcastIcon.path,
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("مدیریت پادکست ها")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              icon: ImageIcon(
                Assets.icons.w.image().image,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => onChange(2),
              icon: ImageIcon(
                Assets.icons.pen.image().image,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
