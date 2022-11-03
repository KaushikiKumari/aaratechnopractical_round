import 'package:aaratechnopractical_round/utils/colors.dart';
import 'package:aaratechnopractical_round/utils/strings.dart';
import 'package:aaratechnopractical_round/utils/stringsstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final color = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: color.backgroundColor,
        drawer: ClipRRect(
          child: Drawer(),
        ),
        key: _scaffoldkey,
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: color.iconColor),
          backgroundColor: color.backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.notes),
            onPressed: () => _scaffoldkey.currentState!.openDrawer(),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.search, color: color.iconColor, size: 28))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading(),
            _productlist(),
          ],
        ))));
  }

  Widget _heading() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(Strings.HOME_TITLE, style: StringsStyle.hometitlestyle),
    );
  }

  Widget _productlist() {
    return Container(
        color: color.backgroundColor,
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 2.1,
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: InkWell(
                      onTap: () {
                        // Get.to(CategoryDetailPage(),
                        //     transition: Transition.rightToLeftWithFade,
                        //     duration: Duration(microseconds: 700));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      )));
            }));
  }
}
