import 'package:flutter/material.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';
import 'package:trainyourbrain/utils/extensions/date_time_extension.dart';

import '../../../components/sizing_box.dart';
import '../../../domain/models/data_models/notification_model.dart';
import '../../../utils/constants/container_util.dart';
import '../../../utils/responsive/size_config.dart';
import 'notification_sheet.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final String nId;
  const NotificationCard({
    required this.notification,
    required this.nId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 1)
          .copyWith(bottom: 2),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      decoration: BoxDecoration(
        color: !notification.isRead!
            ? KColors.primaryColor.withOpacity(0.2)
            : Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              // border: Border.all(
              //   color: source == 'c' ? Colors.white : primaryColor,
              //   width: 0.5,
              // ),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: const Icon(Icons.notifications)),
          ),
          const Sbw(w: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   notification.title!,
                //   style: kSmallTextStyle.copyWith(
                //     // color: !notification.isRead! ? Colors.white : primaryColor,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // const Sbh(h: 3.5),
                Text(
                  notification.description!,
                  overflow: TextOverflow.clip,
                  style: Kstyles.kSmallTextStyle.copyWith(
                    fontSize: getFontSize(12.5),
                    // color: !notification.isRead! ? Colors.white : primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  convertToAgo(notification.recievedAt!.toDate()),
                  style: Kstyles.kSmallTextStyle.copyWith(
                    color: KColors().greyColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: roundedShapeStan,
                    builder: (context) => NotificationSheet(
                      notification: notification,
                      nId: nId,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.more_vert,
                  // color: !notification.isRead! ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
