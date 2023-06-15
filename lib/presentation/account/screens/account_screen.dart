import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/presentation/account/compo/popup_menu.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';

import '../../../components/appbars/profile_appbar.dart';
import '../../providers/user_provider.dart';
import '../compo/profile_header.dart';

class AccountScreen extends StatefulWidget {
  static const id = KRoutes.accountScreen;
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [PopupMenu()],
      ),
      backgroundColor: KColors.whiteColor,
      body: Consumer<UserProvider>(builder: (_, __, ___) {
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            ProfileAppbar(user: __.currentUser!),
            SliverToBoxAdapter(
              child: ProfileHeader(
                user: __.currentUser!,
              ),
            ),
          ],
        );
      }),
    );
  }
}
