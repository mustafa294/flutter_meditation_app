import 'package:flutter/material.dart';
import 'package:meditation_app/utils/constants.dart';

class HomePage extends StatelessWidget {
  final String quote;

  HomePage(this.quote);

  buildMain(double height, double width) {
    return Scaffold(
      body: Column(
        children: [
          buildTopPart(height, width),
          buildPlaylistPart(height, width),
          buildCreatorPart(height, width),
        ],
      ),
    );
  }

  // returns a container which covers 30 % of the screen height
  // from the top of the screen
  Container buildTopPart(double height, double width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: height * 0.3,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${ImagePath.path}homepage.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "MEDITATION",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            quote,
          ),
        ],
      ),
    );
  }

  buildPlaylistPart(double height, double width) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20),
      height: height * 0.4,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended Playlist",
            style: TextStyle(
              color: AppColor.greenColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildPlaylistCard(
                  height,
                  image: "night-moon.png",
                  audios: "25 Audios",
                  songType: "Sleep\nTight",
                ),
                buildPlaylistCard(
                  height,
                  image: "forest.png",
                  audios: "36 Audios",
                  songType: "Forest\nSongs",
                ),
                buildPlaylistCard(
                  height,
                  image: "night-moon.png",
                  audios: "12 Audios",
                  songType: "Outdoor\nSpark",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCreatorPart(double height, double width) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: height * 0.3,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Creator",
            style: TextStyle(
              color: AppColor.greenColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCreatorCard(),
                buildCreatorCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildCreatorCard() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 20),
      padding: EdgeInsets.only(left: 20, top: 20),
      width: 250,
      decoration: BoxDecoration(
        color: AppColor.lightorangeColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage("${ImagePath.path}girl.png"),
          alignment: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Kayleigh\nColeman",
            style: TextStyle(
              color: AppColor.greenColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Audio Engineer\n36 Audio",
            style: TextStyle(
              color: AppColor.darkBlueColor,
            ),
          ),
        ],
      ),
    );
  }

  Container buildPlaylistCard(double height,
      {String image, String songType, String audios}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 20),
      padding: EdgeInsets.only(left: 10, top: 10),
      height: height * 0.3,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage("${ImagePath.path}" + image),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            songType,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            audios,
            style: TextStyle(
              fontSize: 12,
              color: AppColor.orangeColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return buildMain(height, width);
  }
}
