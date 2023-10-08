import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/utils/image_constant.dart';
import 'package:quickbank_revised/core/utils/size_utils.dart';
import 'package:quickbank_revised/presentation/sign_in_done_screen/sign_in_done_screen.dart';
import 'package:quickbank_revised/theme/app_decoration.dart';
import 'package:quickbank_revised/theme/theme_helper.dart';
import 'package:quickbank_revised/widgets/custom_image_view.dart';
import 'package:quickbank_revised/widgets/text_box.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfilEditScreen extends StatefulWidget {
  ProfilEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfilEditScreen> createState() => _ProfilEditScreenState();
}

class _ProfilEditScreenState extends State<ProfilEditScreen> {
  File? _selectedImage;

  final currentUser = FirebaseAuth.instance.currentUser!;

  final usersCollection = FirebaseFirestore.instance.collection("user");

  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _usia = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();

  String imageUrl = " ";

  void pickUpLoadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );

    if (image != null) {
      final email = currentUser.email;
      Reference ref =
          FirebaseStorage.instance.ref().child("profilepics/$email.jpg");

      await ref.putFile(File(image.path));
      final imageUrl = await ref.getDownloadURL();

      await usersCollection
          .doc(currentUser.email)
          .update({'profile_picture': imageUrl});

      setState(() {
        this.imageUrl = imageUrl;
      });
    }
  }

  void onPressedLogout() async {
    final email = currentUser.email;

    if (_selectedImage != null) {
      Reference ref =
          FirebaseStorage.instance.ref().child("profilepics/$email.jpg");

      await ref.putFile(_selectedImage!);
    }
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => SignInDoneScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final userDocument = await FirebaseFirestore.instance
          .collection('user')
          .doc(currentUser!.email)
          .get();

      if (userDocument.exists) {
        final userData = userDocument.data() as Map<String, dynamic>;
        setState(() {
          _firstname.text = userData['nama depan'] ?? '';
          _lastname.text = userData['nama belakang'] ?? '';
          _usia.text = userData['usia'] ?? '';
          _phonenumber.text = userData['nomor telepon']?.toString() ?? '';

          imageUrl = userData['profile_picture'] ?? " ";
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> editField(BuildContext context, String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit  $field",
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Isi $field baru",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Simpan',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (field == 'nama depan') {
                _firstname.text = newValue;
              } else if (field == 'nama belakang') {
                _lastname.text = newValue;
              } else if (field == 'usia') {
                _usia.text = newValue;
              } else if (field == 'nomor telepon') {
                _phonenumber.text = newValue;
              }
              Navigator.of(context).pop();
              setState(() {});
            },
          ),
        ],
      ),
    );
    if (newValue.trim().length > 0) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgWavebackground,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(
                              right: 5.h,
                              top: 15.v,
                              bottom: 15.v,
                            ),
                            onPressed: () {
                              onPressedLogout();
                            },
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: SizedBox(
                                    height: 35,
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Profil",
                                            style: theme.textTheme.titleLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 660,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.v),
                    decoration: AppDecoration.outlineBlack900.copyWith(),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                pickUpLoadImage();
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: imageUrl != " "
                                      ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(imageUrl),
                                        )
                                      : null,
                                ),
                                child: Center(
                                  child: imageUrl == " "
                                      ? const Icon(
                                          Icons.person,
                                          size: 80,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.v),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Info Saya",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        TextBox(
                          text: _firstname.text,
                          sectionName: 'Nama Depan',
                          onPressed: () => editField(context, 'nama depan'),
                        ),
                        TextBox(
                          text: _lastname.text,
                          sectionName: 'Nama Belakang',
                          onPressed: () => editField(context, 'nama belakang'),
                        ),
                        TextBox(
                          text: _usia.text,
                          sectionName: 'Usia',
                          onPressed: () => editField(context, 'usia'),
                        ),
                        TextBox(
                          text: _phonenumber.text,
                          sectionName: 'Nomor Telepon',
                          onPressed: () => editField(context, 'nomor telepon'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose TextEditingControllers
    _firstname.dispose();
    _lastname.dispose();
    _usia.dispose();
    _phonenumber.dispose();
    super.dispose();
  }
}
