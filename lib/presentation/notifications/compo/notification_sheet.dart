import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../components/drag_handle.dart';
import '../../../components/sizing_box.dart';
import '../../../domain/models/data_models/notification_model.dart';
import '../../providers/feedback_provider.dart';

class NotificationSheet extends StatelessWidget {
  final NotificationModel notification;
  final String nId;
  const NotificationSheet({
    required this.notification,
    required this.nId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DragHandle(),
          const Sbh(h: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: KColors.primaryColor,
                width: 0.5,
              ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: const Icon(Icons.notifications)),
          ),
          const Sbh(h: 7),
          Text(
            notification.description!,
            overflow: TextOverflow.clip,
            style: Kstyles.kSmallTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: KColors.primaryColor,
            ),
          ),
          const Sbh(h: 8),
          ListTile(
            leading: Icon(
              Icons.mark_chat_read,
              color: Colors.grey[700],
            ),
            contentPadding: const EdgeInsets.only(left: 12),
            title: Text(
              !notification.isRead! ? "Mark as Read" : "Mark as Unread",
              style: Kstyles.kSmallTextStyle.copyWith(
                color: Colors.grey[700],
                // color: !isRead ? Colors.white : primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Provider.of<FeedbackProvider>(context, listen: false);
              //     .markNotification(
              //   nModel: notification,
              //   context: context,
              //   nId: nId,
              // );
            },
          ),
          Visibility(
            visible: !notification.isDeleted!,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 12),
              leading: Icon(
                Icons.remove_circle,
                color: Colors.grey[700],
              ),
              title: Text(
                "Remove this notification",
                style: Kstyles.kSmallTextStyle.copyWith(
                  color: Colors.grey[700],
                  // color: !isRead ? Colors.white : primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {},
            ),
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.report,
          //     color: Colors.grey[700],
          //   ),
          //   title: Text(
          //     "Report to notification team",
          //     style: TextStyle(
          //       color: Colors.grey[700],
          //       // color: !isRead ? Colors.white : primaryColor,
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          const Sbh(h: 12),
        ],
      ),
    );
  }
}
