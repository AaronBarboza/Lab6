import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfo {
  final String? displayName;
  final String? email;
  final String? registrationDate;

  UserInfo({this.displayName, this.email, this.registrationDate});

  factory UserInfo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserInfo(
      displayName: data['Name Surname'] as String?,
      email: data['E-mail'] as String?,
      registrationDate: data['Registration Date'] as String?,
    );
  }
}

class RecentUsers extends StatefulWidget {
  const RecentUsers({Key? key}) : super(key: key);

  @override
  _RecentUsersState createState() => _RecentUsersState();
}

class _RecentUsersState extends State<RecentUsers> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<UserInfo> firebaseUsers = [];

  @override
  void initState() {
    super.initState();
    fetchFirebaseUsers();
  }

  Future<void> fetchFirebaseUsers() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await usersCollection.get();
    final userDocs = querySnapshot.docs;
    print('Documentos obtenidos: $userDocs');
    firebaseUsers = userDocs.map((doc) => UserInfo.fromFirestore(doc)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Candidates",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text("Name Surname"),
                  ),
                  DataColumn(
                    label: Text("Applied Position"),
                  ),
                  DataColumn(
                    label: Text("E-mail"),
                  ),
                  DataColumn(
                    label: Text("Registration Date"),
                  ),
                  DataColumn(
                    label: Text("Status"),
                  ),
                  DataColumn(
                    label: Text("Operation"),
                  ),
                ],
                rows: List.generate(
                  firebaseUsers.length,
                  (index) => recentUserDataRow(firebaseUsers[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(UserInfo userInfo, BuildContext context) {
  print('Generando fila para: ${userInfo.displayName}');
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.displayName ?? 'N/A',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                userInfo.displayName ?? 'N/A',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(Text('Applied Position')),
      DataCell(Text(userInfo.email ?? 'N/A')),
      DataCell(Text(userInfo.registrationDate ?? 'N/A')),
      DataCell(Text('Status')),
      DataCell(
        Row(
          children: [
            TextButton(
              child: Text('View', style: TextStyle(color: greenColor)),
              onPressed: () {},
            ),
            SizedBox(
              width: 6,
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Icon(Icons.warning_outlined,
                                    size: 36, color: Colors.red),
                                SizedBox(height: 20),
                                Text("Confirm Deletion"),
                              ],
                            ),
                          ),
                          content: Container(
                            color: secondaryColor,
                            height: 70,
                            child: Column(
                              children: [
                                Text(
                                    "Are you sure want to delete '${userInfo.displayName ?? 'N/A'}'?"),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.close,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: Text("Cancel")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () {},
                                        label: Text("Delete"))
                                  ],
                                )
                              ],
                            ),
                          ));
                    });
              },
            ),
          ],
        ),
      ),
    ],
  );
}
