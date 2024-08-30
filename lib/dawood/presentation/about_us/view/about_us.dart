import 'package:flutter/material.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/widgets/about_us_header.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/widgets/detail_container.dart';
import 'package:girlzwhosell/dawood/presentation/about_us/widgets/visit_website.dart';
import 'package:girlzwhosell/dawood/presentation/resources/string_manger.dart';
import 'package:girlzwhosell/dawood/presentation/resources/value_manager.dart';
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
        appBar: AppBar(
          title: Text(AppString.aboutUs),),
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(AppPadding.p20),
          children: [
            aboutUsHeader(context),
            DetailContainer(),
            SizedBox(height: AppSize.s5,),
            visitWebsite(() =>
              launched = _launchInBrowser(url)
            ),

            ],
          )

      ),
    );
  }
}
