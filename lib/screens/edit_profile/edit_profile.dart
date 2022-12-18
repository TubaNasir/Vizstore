import 'package:flutter/material.dart';
import 'package:flutterdemo/controllers/edit_profile_provider.dart';
import 'package:flutterdemo/screens/edit_profile/widgets/edit_profile_form.dart';
import 'package:flutterdemo/screens/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) async => {
              context.read<EditProfileProvider>().setIsFetchingTrue(),
               await context.read<EditProfileProvider>().getUser(),
               context.read<EditProfileProvider>().setIsFetchingFalse(),
            });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "My Profile",
          backButton: true,
        ),
        body: context.watch<EditProfileProvider>().isFetching
            ? Center(child: CircularProgressIndicator())
            :SingleChildScrollView(
          child: EditProfileForm(),
        ),
      ),
    );
  }
}
