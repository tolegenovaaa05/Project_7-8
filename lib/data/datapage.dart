import 'package:flutter/material.dart';
import 'package:flutter_aruka_reg/user.dart';

class UserTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? newUser = ModalRoute.of(context)!.settings.arguments as User?;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Table'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(label: Text('Full Name')),
                DataColumn(label: Text('Phone Number')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Country')),
                DataColumn(label: Text('About Me')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(newUser!.fullName)),
                  DataCell(Text(newUser.phoneNumber)),
                  DataCell(Text(newUser.email)),
                  DataCell(Text(newUser.country)),
                  DataCell(Text(newUser.aboutMe)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
