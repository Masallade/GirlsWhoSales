import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsView extends StatefulWidget {
  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  Future<void>? launched;

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String url = "https://girlzwhosell.com/";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: header(context,titleText: 'Notifications'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Something',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About Us',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              //decoration: BoxDecoration(
              //                       color: Colors.blue[50],
              //                       borderRadius: BorderRadius.circular(10),
              //                     ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.asset('assets/images/splashlogo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'Heidi Solomon-Orlick\nFounder and CEO',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton(
                        color: Colors.white,
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: GestureDetector(
                                    onTap: () => setState(() {
                                          launched = _launchInBrowser(url);
                                        }),
                                    child: Text("Go To Website")),
                                value: 1,
                              ),
                            ]),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/location.png'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('USA'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Our   mission   in  launching GirlzWhoSell   is   to   close   the gender   gap   in   B2B   sales   and   create   the   largest pipeline   of   diverse   early  stage   female   sales   talent. We   want   to   establish   sales as   an   intentional   and  viable   career   choice.',
                          maxLines: 13,
                          // textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                        Image.asset(
                            'assets/images/heidisolomon-removebg-preview.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
