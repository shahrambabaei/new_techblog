import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_techblog/constants/mystring.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/view/maycats_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.techbot,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              MyString.welcome,
              style: textTheme.headlineMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              MyString.welcomeescription,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
              
                _showEmailBottomSheet(context, textTheme);
              },
              child: Text(
                "بزن بریم",
                style: textTheme.displayLarge,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.insertYourEmail,
                  style: textTheme.headlineMedium,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        hintStyle: textTheme.headlineSmall,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onChanged: (value) {
                    
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activateCodeBottomSheet(context, textTheme);
                    },
                    child: Text(
                      "ادامه",
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.activateCode,
                  style: textTheme.headlineMedium,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      hintText: "*****",
                    ),
                    onChanged: (value) {
                    
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCatsWidget(),
                          ));
                    },
                    child: Text(
                      "ادامه",
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
