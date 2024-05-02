import 'package:flutter/material.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/features/profile/presentation/widgets/infomation_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Setting',
        context: context,
      ),
      body: Column(
        children: [
          InformationItem(
            title: 'Notification Settings ',
            icon: MediaResource.notificationSettingIcon,
            onTap: () {},
          ),
          InformationItem(
            title: 'Password Manager ',
            icon: MediaResource.passwordManageIcon,
            onTap: () {},
          ),
          InformationItem(
            title: 'Delete Account ',
            icon: MediaResource.deleteAccountIcon,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
