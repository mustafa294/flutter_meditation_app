import 'package:flutter/material.dart';
import 'package:meditation_app/utils/constants.dart';

class PlaylistPage extends StatelessWidget {
  final List song = [
    {
      "songName": "Summer Romance",
      "songSinger": "Ezra Queens",
      "songDuration": "18:42"
    },
    {
      "songName": "Moonlight Sonata",
      "songSinger": "Sherina Landorf",
      "songDuration": "22:16"
    },
    {
      "songName": "Intergalacting Song",
      "songSinger": "Kayleigh Coleman",
      "songDuration": "36:21"
    },
    {
      "songName": "Hymn of the Forest ",
      "songSinger": "Ultimusica Studio",
      "songDuration": "42:38"
    },
  ];

  Scaffold buildMain(double width, double height) {
    return Scaffold(
      body: Column(
        children: [
          buildUpperPart(width, height),
          buildLowerPart(),
        ],
      ),
    );
  }

  // this is upper part of the body which takes 40 % of the screen height.
  Container buildUpperPart(double width, double height) {
    return Container(
      width: width,
      height: height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${ImagePath.path}playlist-page.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            alignment: Alignment.center,
            height: height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Now Playing",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Heartfelt Melody",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Orchestra Studio",
                        style: TextStyle(
                          color: AppColor.orangeColor,
                        ),
                      ),
                      MusicPlayer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.4 - 50,
            height: 100,
            width: width,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMusicPlayer(
                      40, AppColor.greenColor, "music-backward.png"),
                  buildMusicPlayer(75, AppColor.orangeColor, "music-play.png"),
                  buildMusicPlayer(40, AppColor.greenColor, "music-forward.png")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //this part returns available space of the screen after upper part
  // and contains Playlist songs
  Widget buildLowerPart() {
    return Expanded(
      child: Column(
        children: [
          buildPlaylistTitle(),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemCount: song.length,
              itemBuilder: (context, index) {
                return buildPlayListSongContainer(
                  songName: song[index]["songName"],
                  singerName: song[index]["songSinger"],
                  songDuration: song[index]["songDuration"],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildPlaylistTitle() {
    return Padding(
      padding: EdgeInsets.only(
        top: 70,
        bottom: 20,
      ),
      child: Text(
        "Other Audio in the Playlist",
        style: TextStyle(
          color: AppColor.greenColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container buildPlayListSongContainer(
      {String songName, String singerName, String songDuration}) {
    return Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(thickness: 2, height: 2),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 25),
                CircleAvatar(
                  backgroundColor: AppColor.orangeColor,
                  backgroundImage:
                      AssetImage("${ImagePath.path}music-pause.png"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songName ?? "",
                      style: TextStyle(
                        color: AppColor.darkBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          singerName ?? "none",
                          style: TextStyle(
                            color: AppColor.lightGreenColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(
                            color: AppColor.lightGreenColor,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          songDuration ?? "none",
                          style: TextStyle(
                            color: AppColor.lightGreenColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Container buildMusicPlayer(double diameter, Color color, String image) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("${ImagePath.path}" + image), fit: BoxFit.cover),
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return buildMain(width, height);
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key key,
  }) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double _currentSliderValue = 0.2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("09:45"),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Slider.adaptive(
            value: _currentSliderValue,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
            activeColor: AppColor.orangeColor,
            inactiveColor: AppColor.greenColor,
          ),
        ),
        Text("21:07"),
      ],
    );
  }
}
