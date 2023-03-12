// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:leske_share/core/core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'Outfit',
          color: const Color(0xFF101213),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        );
    var emailTextSyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'Outfit',
          color: const Color(0xFF39D2C0),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );
    const divider = Divider(
      height: 44,
      thickness: 1,
      indent: 24,
      endIndent: 24,
      color: Color(0xFFE0E3E7),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: GestureDetector(
              // onTap: () => context.pop(),
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xFF57636C),
                size: 40,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // user info
            PhysicalModel(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10,
              color: const Color(0xFF4B39EF),
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/seed/470/600'),
                ),
              ),
            ),

            12.hSizedBox,

            Text('John Deo', style: titleStyle),

            4.hSizedBox,

            Text('andrea@domainname.com', style: emailTextSyle),

            divider,

            // tiles
            const ToggleListTile(),

            const ProfileActionTile(
              title: 'Edit Profile',
              leadingIcon: Icons.account_circle_outlined,
              trailingIcon: CupertinoIcons.forward,
            ),

            const ProfileActionTile(
              title: 'Account Settings',
              leadingIcon: CupertinoIcons.settings,
              trailingIcon: CupertinoIcons.forward,
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleListTile extends StatelessWidget {
  const ToggleListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return SwitchListTile(
          title: const Text('Switch to Dark Mode'),
          value: isDarkMode,
          onChanged: (value) => setState(() => isDarkMode = value),
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.grey,
        );
      },
    );
  }
}

class ProfileActionTile extends StatelessWidget {
  const ProfileActionTile({
    Key? key,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE0E3E7),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
          child: ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(title),
            leading: Icon(leadingIcon, size: 24),
            trailing: Icon(trailingIcon, size: 24),
          ),
        ),
      ),
    );
  }
}
