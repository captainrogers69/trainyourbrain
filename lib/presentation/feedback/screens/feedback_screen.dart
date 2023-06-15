import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainyourbrain/utils/constants/k_colors.dart';
import 'package:trainyourbrain/utils/constants/k_routes.dart';
import 'package:trainyourbrain/utils/constants/kstyles.dart';

import '../../../components/sizing_box.dart';
import '../../providers/feedback_provider.dart';
import '../compo/appbar_actions.dart';
import '../compo/detail_textfield.dart';
import '../compo/image_selector.dart';

class FeedbackScreen extends StatefulWidget {
  static const id = KRoutes.feedbackScreen;
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedback = TextEditingController();
  final _options = [
    "Overall Services",
    "Customer Support",
    "Speed and Efficiency",
    "Service Quality",
    "Pick & Delivery Services",
    "Home Services",
    "Transparency"
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<FeedbackProvider>(context, listen: false).clearFeedback();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedbackProvider>(
      builder: (_, __, ___) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("FeedBack"),
            actions: [
              AppBarActions(
                createTitle: "Submit",
                creatingUpdating: true,
                buttonState: __.reviewButtonState,
                create: () {
                  Provider.of<FeedbackProvider>(context, listen: false)
                      .createFeedback(context: context, fd: _feedback.text);
                },
                update: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5).copyWith(left: 8),
                  child: const Text(
                    "Rate Your Experience",
                    style: Kstyles.kAppBarTextStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Are you satisfied with our services ?",
                    style: Kstyles.kSmallTextStyle,
                  ),
                ),
                const Sbh(h: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) {
                        return IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          onPressed: () {
                            Provider.of<FeedbackProvider>(context,
                                    listen: false)
                                .configRating(index);
                          },
                          icon: Row(
                            children: [
                              __.selectedRating.contains(index)
                                  ? Image.asset(
                                      "assets/imageAssets/review.png",
                                      width: 30,
                                      height: 30,
                                      color: __.selectedRating.contains(index)
                                          ? __.selectedRating.length == 1
                                              ? const Color(0xffFF0013)
                                              : __.selectedRating.length == 2
                                                  ? const Color(0xffFC516A)
                                                  : __.selectedRating.length ==
                                                          3
                                                      ? const Color(0xffF7941D)
                                                      : __.selectedRating
                                                                  .length ==
                                                              4
                                                          ? const Color(
                                                              0xff00A651)
                                                          : const Color(
                                                              0xff006838)
                                          : Colors.white,
                                    )
                                  : Image.asset(
                                      "assets/imageAssets/featherstar.png",
                                      width: 30,
                                      height: 30,
                                      color: KColors.primaryColor,
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Sbh(h: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Tell us what can we improve",
                    style: Kstyles.kAppBarTextStyle,
                  ),
                ),
                const Sbh(h: 4),
                Wrap(
                  children: List.generate(
                    _options.length,
                    (index) => IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      onPressed: () {
                        Provider.of<FeedbackProvider>(context, listen: false)
                            .configImproves(_options[index]);
                      },
                      icon: Chip(
                        label: Text(
                          _options[index],
                          style: Kstyles.kSmallTextStyle.copyWith(
                            color: __.selectedImproves.contains(_options[index])
                                ? KColors.whiteColor
                                : KColors().greyColor,
                          ),
                        ),
                        backgroundColor:
                            __.selectedImproves.contains(_options[index])
                                ? KColors.primaryColor
                                : KColors.whiteColor,
                        side: BorderSide(
                          color: __.selectedImproves.contains(_options[index])
                              ? KColors.primaryColor
                              : KColors().greyColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const Sbh(h: 8),
                Padding(
                  padding: const EdgeInsets.all(5).copyWith(left: 8),
                  child: const Text(
                    "Let us know your thoughts",
                    style: Kstyles.kAppBarTextStyle,
                  ),
                ),
                DetailTextfield(
                  labelText: "",
                  maxLines: 6,
                  minLines: null,
                  controller: _feedback,
                  hintText: "Tell us how we can improve",
                ),
                Padding(
                  padding: const EdgeInsets.all(5).copyWith(left: 8),
                  child: const Text(
                    'Attach Files',
                    style: Kstyles.kAppBarTextStyle,
                  ),
                ),
                const Sbh(h: 8),
                ImageSelector(
                  useAvatar: false,
                  image: __.selectedImg,
                  onGallery: () {
                    Provider.of<FeedbackProvider>(context, listen: false)
                        .configFile(true);
                  },
                  onCamera: () {
                    Provider.of<FeedbackProvider>(context, listen: false)
                        .configFile(false);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
