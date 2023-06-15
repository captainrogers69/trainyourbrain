import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/k_fetching.dart';
import '../../../domain/models/data_models/notification_model.dart';
import '../../../utils/constants/k_routes.dart';
import '../../providers/feedback_provider.dart';
import '../compo/error_compo.dart';
import '../compo/notitifcation_card.dart';

class NotificationScreen extends StatefulWidget {
  static const id = KRoutes.notificationScreen;
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FeedbackProvider>(context, listen: false).fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Notifications'),
      ),
      body: Consumer<FeedbackProvider>(
        builder: (_, __, ___) {
          return Visibility(
            visible: __.fetchingNotifications,
            replacement: __.allNotifications.isEmpty
                ? const Center(
                    child: ErrorCompo(
                      warningText: 'No Notifications here',
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: __.allNotifications.length,
                    itemBuilder: (context, index) {
                      NotificationModel notification =
                          NotificationModel.fromMap(
                              __.allNotifications[index].data());
                      return NotificationCard(
                        nId: __.allNotifications[index].id,
                        notification: notification,
                      );
                    },
                  ),
            child: const WitFetching(),
          );
        },
      ),
    );
  }
}
