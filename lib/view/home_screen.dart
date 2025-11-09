import 'package:flutter/material.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/mystring.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          HomePagePoster(textTheme: textTheme),
          SizedBox(
            height: 50,
          ),
          HomeSceenTagList(textTheme: textTheme),
          SeeMoreBlog(textTheme: textTheme),
          HomePageBlogList(textTheme: textTheme),
          SeeMorePodcast(textTheme: textTheme),
          HomeScreenPOdcastList(textTheme: textTheme),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class HomeSceenTagList extends StatelessWidget {
  const HomeSceenTagList({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: GradientColors.tags)),
            child: Row(
              children: [
                ImageIcon(
                  Assets.icons.hashTagIcon.image().image,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  tagList[index].title,
                  style: textTheme.headlineSmall!
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenPOdcastList extends StatelessWidget {
  const HomeScreenPOdcastList({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 7).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                            blogList[index].imageUrl,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    blogList[index].title,
                    style: textTheme.headlineMedium,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pen.image().image,
            color: SolidColors.seeMore,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            MyString.viewHotestPodCasts,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 7).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 200,
              // height: 200,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                blogList[index].imageUrl,
                              ),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost)),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                blogList[index].writer,
                                style: textTheme.displayMedium,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    blogList[index].views,
                                    style: textTheme.displayMedium,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    blogList[index].title,
                    style: textTheme.headlineMedium,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pen.image().image,
            color: SolidColors.seeMore,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            MyString.viewHotestBlog,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(Assets.images.banner.path),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      homePagePosterMap["writer"] + homePagePosterMap["date"],
                      style: textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Like 253",
                          style: textTheme.bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.remove_red_eye_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  homePagePosterMap["title"],
                  style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
