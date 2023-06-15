import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/presentation/feedback/compo/appbar_actions.dart';
import 'package:trainyourbrain/presentation/feedback/compo/detail_textfield.dart';
import 'package:trainyourbrain/presentation/feedback/compo/image_selector.dart';
import 'package:trainyourbrain/presentation/providers/user_provider.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../domain/models/data_models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  static const id = KRoutes.editprofileScreen;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _profileName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  @override
  void initState() {
    super.initState();
    _profileName.text = widget.user.profileName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, __, ___) {
      return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text(
            'Edit Profile',
            style: Kstyles.kAppBarTextStyle,
          ),
          actions: [
            AppBarActions(
              creatingUpdating: true,
              create: () {},
              update: () {},
              createTitle: "Submit",
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageSelector(
                useAvatar: false,
                image: __.profileImg,
                onGallery: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .configFile(true);
                },
                onCamera: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .configFile(false);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: DetailTextfield(
                          labelText: 'Firstname',
                          controller: _firstname,
                          hintText: 'Firstname'),
                    ),
                    Flexible(
                      child: DetailTextfield(
                          labelText: 'Lastname',
                          controller: _lastname,
                          hintText: 'Lastname'),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DetailTextfield(
                  labelText: "Username",
                  controller: _profileName,
                  hintText: "username",
                ),
              ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DetailTextfield(
                  labelText: "Email",
                  controller: _email,
                  hintText: "email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DetailTextfield(
                  labelText: "Phone",
                  controller: _phone,
                  hintText: "Mobile Number",
                  keyBoardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DetailTextfield(
                  labelText: "Bio",
                  controller: _bio,
                  hintText: "Write about yourself",
                  maxLines: 5,
                  minLines: null,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
