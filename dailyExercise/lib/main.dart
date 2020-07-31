import 'package:flutter/material.dart';
import 'package:dailyExercise/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cario',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                              color: Color(0xFFF2BEA1), shape: BoxShape.circle),
                          child: SvgPicture.asset("assets/icons/menu.svg"),
                        ),
                      ),
                      Text(
                        'Good morning TIKDERJAR',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29.5)),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              icon:
                                  SvgPicture.asset("assets/icons/search.svg")),
                        ),
                      ),
                      Expanded(
                          child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            svgsrc: "assets/icons/Hamburger.svg",
                            title: "Diet Reccommend",
                          ),
                          CategoryCard(
                              svgsrc: "assets/icons/Excrecises.svg",
                              title: "Kaly Exercises"),
                          CategoryCard(
                              svgsrc: "assets/icons/Meditation.svg",
                              title: "Meditation"),
                          CategoryCard(
                              svgsrc: "assets/icons/yoga.svg",
                              title: "Yoga time")
                        ],
                      ))
                    ],
                  )))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String svgsrc;
  final String title;
  final Function press;
  const CategoryCard({Key key, this.svgsrc, this.title, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor)
        ], color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: press,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    SvgPicture.asset(svgsrc),
                    Spacer(),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 15))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
