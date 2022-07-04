import 'package:akhir/nav_bar_user.dart';
import 'package:akhir/page_belum_diatur.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  String title = 'AlertDialog';
  bool tappedYes = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final action = await AlertDialogs.yesCancelDialog(
                context, 'Keluar', 'Apakah anda yakin untuk keluar akun?');
            if (action == DialogsAction.yes) {
              setState(() => tappedYes = true);
            } else {
              setState(() => tappedYes = false);
            }
          },
          // padding: EdgeInsets.all(12.0),
          // color: Color(0xFFC41A3B),
          child: Text(
            'Logout'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
              child: Text(
                'Batal',
                style: TextStyle(
                    color: Color(0xff142D4C), fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => NavBarUser(),
                ),
                (route) => false,
              ),
              child: Text(
                'Ya',
                style: TextStyle(
                    color: Color(0xff142D4C), fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogsAction.cancel;
  }
}
