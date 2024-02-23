import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_test_project/screens/home_page/provider/home_provider.dart';
import 'package:new_test_project/theme/app_decoration.dart';
import 'package:provider/provider.dart';

import '../../core/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key})
      : super(
          key: key,
        );

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    HomeProviders homeProvider =
        Provider.of<HomeProviders>(context, listen: false);
    await homeProvider.fetchUserHome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: _buildAppBar(context),
          body: Consumer<HomeProviders>(builder: (context, homeProviders, _) {
            return homeProviders.getHomeModel == null
                ? const Center(
                    child: Text(
                      "No Data",
                    ),
                  )
                : ListView.builder(
                    itemCount: homeProviders.getHomeModel!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(15, 16, 15, 15),
                        decoration: AppDecoration.outlinePrimaryContainer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildThirteen(
                              context,
                              userName: homeProviders
                                  .getHomeModel![index].user!.username
                                  .toString(),
                              time: timeFormat(
                                time: homeProviders
                                    .getHomeModel![index].createdAt
                                    .toString(),
                              ),
                              content: homeProviders
                                  .getHomeModel![index].content
                                  .toString(),
                              image: homeProviders.getHomeModel![index].image
                                  .toString(),
                            ),
                            const SizedBox(height: 8),
                            homeProviders.getHomeModel![index].image == null
                                ? const SizedBox()
                                : CustomImageView(
                                    imagePath: homeProviders
                                        .getHomeModel![index].image,
                                    height: 187,
                                    width: 313,
                                    radius: BorderRadius.circular(
                                      17,
                                    ),
                                    alignment: Alignment.centerRight,
                                  ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 44),
                              child: _buildFrameFive(context),
                            ),
                            const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.only(left: 44),
                              child: Text(
                                "${homeProviders.getHomeModel![index].likesCount.toString()} Like",
                                style: CustomTextStyles
                                    .bodyLargeOnPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
          })),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 50,
      centerTitle: true,
      title: AppbarTitleImage(
        imagePath: ImageConstant.imgVector,
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameEleven(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
      decoration: AppDecoration.outlinePrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAvatar,
            height: 36,
            width: 36,
            margin: const EdgeInsets.only(bottom: 108),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: _buildTwentySix(
              context,
              username: "Ruchi_shah",
              distance: "49m",
              description:
                  "Failures are stepping stones to success.\nEmbrace them, learn from them, and keep\nmoving forward",
              likeCount: "2 like",
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThirteen(
    BuildContext context, {
    required String userName,
    required String time,
    required String content,
    required String image,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: image,
          height: 36,
          width: 36,
          margin: const EdgeInsets.only(bottom: 48),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFrameSeven(
                  context,
                  userName: userName,
                  distanceText: time,
                ),
                const SizedBox(height: 3),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 12),
                  child: Text(
                    content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTwentySeven(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      padding: const EdgeInsets.fromLTRB(10, 16, 10, 15),
      decoration: AppDecoration.outlinePrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAvatar,
            height: 36,
            width: 36,
            margin: const EdgeInsets.only(
              left: 6,
              bottom: 165,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: _buildTwentySix(
              context,
              username: "Ruchi_shah",
              distance: "49m",
              description:
                  "Failures are stepping stones to success.\nEmbrace them, learn from them, and keep\nmoving forward.Failures are stepping stones to success.\nEmbrace them, learn from them, and keep\nmoving forward",
              likeCount: "2 like",
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameSeven(
    BuildContext context, {
    required String userName,
    required String distanceText,
  }) {
    return SizedBox(
      width: 313,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              userName,
              style: CustomTextStyles.bodyLargeThin.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              distanceText,
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.img3dots,
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(left: 9),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameFive(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgHeartOnerrorcontainer,
          height: 24,
          width: 24,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgSearch,
          height: 24,
          width: 24,
          margin: const EdgeInsets.only(left: 12),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildTwentySix(
    BuildContext context, {
    required String username,
    required String distance,
    required String description,
    required String likeCount,
  }) {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 313,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      username,
                      style: CustomTextStyles.bodyLargeThin.copyWith(
                        color: theme.colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      distance,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.img3dots,
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(left: 9),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Container(
              width: 292,
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                description,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgHeart,
                  height: 24,
                  width: 24,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgSearch,
                  height: 24,
                  width: 24,
                  margin: const EdgeInsets.only(left: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              likeCount,
              style: CustomTextStyles.bodyLargeOnPrimaryContainer.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeFormat({required String time}) {
    String timestampString = time;
    DateTime timestamp = DateTime.parse(timestampString);
    String formattedTime = DateFormat('HH:mm').format(timestamp);
    return formattedTime.toString();
    // print(formattedTime);
  }
}
