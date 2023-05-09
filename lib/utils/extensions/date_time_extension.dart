String dateForm = 'dd/MM/yyyy';
String timeForm = 'h:mm a';

final now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);
final yest = DateTime(now.year, now.month, now.day - 1);
final tomo = DateTime(now.year, now.month, now.day + 1);

extension DateTimeExtension on dynamic {
  String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  String formatDateT(DateTime datt) {
    if (DateFormat(dateForm).format(today) ==
        DateFormat(dateForm).format(datt)) {
      return 'Today at ${DateFormat(timeForm).format(datt)}';
    } else if (DateFormat(dateForm).format(yest) ==
        DateFormat(dateForm).format(datt)) {
      return 'Yesterday at ${DateFormat(timeForm).format(datt)}';
    } else if (DateFormat(dateForm).format(tomo) ==
        DateFormat(dateForm).format(datt)) {
      return 'Tomorrow at ${DateFormat(timeForm).format(datt)}';
    } else {
      return DateFormat(dateForm).format(datt) +
          " at " +
          DateFormat(timeForm).format(datt);
    }
  }

  String agoFormatter(DateTime datt) {
    String daysAgo = '';
    String timeAgo = '';
    if (DateFormat(dateForm).format(today) ==
        DateFormat(dateForm).format(datt)) {
      daysAgo = 'Today';
    } else if (DateFormat(dateForm).format(yest) ==
        DateFormat(dateForm).format(datt)) {
      daysAgo = 'Yesterday';
    } else if (DateFormat(dateForm).format(tomo) ==
        DateFormat(dateForm).format(datt)) {
      daysAgo = 'Tomorrow';
    } else {
      daysAgo = DateFormat(dateForm).format(datt);
    }
    if (daysAgo == 'Yesterday') {
      timeAgo = DateFormat(timeForm).format(datt);
    } else {
      timeAgo = convertToAgo(datt);
    }
    return "$daysAgo • $timeAgo";
  }

  String convertToAgo(DateTime dateTime) {
    DateTime input = dateTime;
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }

  String formatDate(DateTime datt) {
    return DateFormat(dateForm).format(datt);
  }

  String formatTime(DateTime datt) {
    return DateFormat(timeForm).format(datt);
  }

  /////////////////////////
  String durationFormatter(double value) {
    int? days, hours, minutes;
    double? dayFor, hoursFor, minutesFor;
    String result = '';
    dayFor = double.parse((value ~/ 1440).toString());
    hoursFor = double.parse((((value - dayFor * 1440)) ~/ 60).toString());
    minutesFor =
        double.parse((value - (dayFor * 1440) - (hoursFor * 60)).toString());
    days = dayFor.toInt();
    hours = hoursFor.toInt();
    minutes = minutesFor.toInt();
    String daysLeft = days.toString().length < 2 ? "0$days" : days.toString();
    String hoursLeft =
        hours.toString().length < 2 ? "0$hours" : hours.toString();
    String minutesLeft =
        minutes.toString().length < 2 ? "0$minutes" : minutes.toString();
    if (days > 0) {
      if (minutes > 0 && hours == 0) {
        result = "$daysLeft days - $minutesLeft mins";
      } else if (minutes == 0 && hours > 0) {
        result = "$daysLeft days - $hoursLeft hrs";
      } else if (minutes == 0 && hours == 0) {
        result = "$daysLeft days";
      } else {
        result = "$daysLeft days - $hoursLeft hrs - $minutesLeft mins";
      }
    } else if (days == 0 && hours > 0) {
      if (hours > 0 && minutes > 0) {
        result = "$hoursLeft hrs - $minutesLeft mins";
      } else if (hours > 0 && minutes == 0) {
        result = "$hoursLeft hrs";
      }
    } else {
      result = "$minutesLeft mins";
    }
    return result;
  }
}
