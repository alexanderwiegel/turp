import 'package:flutter/material.dart';

class TurpUserListTile extends StatelessWidget {
  final Map<String, dynamic> data;

  const TurpUserListTile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(data["flag"], style: const TextStyle(fontSize: 32)),
      title: Text(data["firstName"] + " " + data["lastName"]),
      subtitle: Text(data["birthdate"]),
    );
  }
}
