import 'package:flutter/material.dart';
import 'package:meditation_app/screens/homepage.dart';
import 'package:meditation_app/utils/constants.dart';

class LoginPage extends StatelessWidget {
  final String quote =
      '"The more regularly and the more deeply you meditate, the sooner you will find yourself acting always from a center of peace."';
  Scaffold buildMain(BuildContext context, double height, double width) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "${ImagePath.path}login-page.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                height: height * 0.6,
              ),
              Container(
                color: Colors.white,
                height: height * 0.4,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: AppColor.orangeColor,
                height: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Text(
                  "MEDITATE",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Meditation App",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  quote,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      buildInputBox("Email", "email.png"),
                      SizedBox(height: 10),
                      buildInputBox("Password", "lock.png"),
                      buildLoginButton(context, width),
                      Text(
                        "Don't have an account yet?",
                        style: TextStyle(
                          color: AppColor.darkBlueColor.withOpacity(0.3),
                        ),
                      ),
                      Text(
                        "Create an account",
                        style: TextStyle(
                          color: AppColor.darkBlueColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  InkWell buildLoginButton(BuildContext context, double width) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(quote),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.orangeColor,
        ),
        child: Center(
          child: Text(
            "Login",
          ),
        ),
      ),
    );
  }

  Container buildInputBox(
    String hintText,
    String suffixImage,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: Container(
            height: 20,
            child: Image.asset("${ImagePath.path}" + suffixImage),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return buildMain(context, height, width);
  }
}
