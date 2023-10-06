import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/utils/image_constant.dart';
import 'package:quickbank_revised/core/utils/size_utils.dart';
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
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );
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
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 5.v),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: SizedBox(
                                    height: 45,
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
                    height: 660.v,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 20.v),
                    decoration: AppDecoration.outlineBlack900.copyWith(),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: _selectedImage != null
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(_selectedImage!),
                                      )
                                    : null, // Remove the placeholder image
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    _pickImageFromGallery();
                                  },
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
                            text: 'sepuh',
                            sectionName: 'Nama Depan',
                            onPressed: () => editField(context, 'Nama Depan')),
                        SizedBox(height: 15.v),
                        TextBox(
                            text: 'puh sepuh',
                            sectionName: 'Nama Belakang',
                            onPressed: () =>
                                editField(context, 'Nama Belakang')),
                        SizedBox(height: 15.v),
                        TextBox(
                            text: '085813131822',
                            sectionName: 'Nomor Telepon',
                            onPressed: () =>
                                editField(context, 'Nomor Telepon')),
                        SizedBox(height: 15.v),
                        TextBox(
                            text: 'Rumah',
                            sectionName: 'Alamat',
                            onPressed: () => editField(context, 'Alamat')),
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

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
