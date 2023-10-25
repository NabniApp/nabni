import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_nabni_app/controller/auth_controller.dart';
import 'package:new_nabni_app/data/model/user_model.dart';
import 'package:new_nabni_app/utiles/app_constants.dart';
import 'package:new_nabni_app/utiles/route_helper.dart';
import 'package:new_nabni_app/view/widgets/custom_button.dart';
import 'package:new_nabni_app/view/widgets/custom_snackbar.dart';
import 'package:new_nabni_app/view/widgets/custom_text_field.dart';
import 'package:new_nabni_app/view/widgets/dialog_done_project.dart';

class EditClientProfileScreen extends StatefulWidget {
  UserModel model;
  EditClientProfileScreen({Key? key, required this.model}) : super(key: key);
  @override
  State<EditClientProfileScreen> createState() =>
      _EditClientProfileScreenState();
}

class _EditClientProfileScreenState extends State<EditClientProfileScreen> {
  TextEditingController _usernameameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _identityController = TextEditingController();

  bool _isObscure = true;

  final formKey = GlobalKey<FormState>();
  String? cityselect;

  @override
  void initState() {
    _usernameameController = TextEditingController(text: widget.model.username);
    _emailController = TextEditingController(text: widget.model.email);
    _phoneController = TextEditingController(text: widget.model.phone);

    _identityController = TextEditingController(text: widget.model.identity);

    cityselect = widget.model.city;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: .7,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff8B7C61),
                )),
            title: Text(
              'تعديل البيانات',
              style: TextStyle(color: Color(0xff8B7C61), fontWeight: FontWeight.bold ,fontFamily: 'Cairo',fontSize: 18),
            ),
            actions: [
              
            ],
          ),
          backgroundColor: Color.fromARGB(255, 254, 253, 249),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            spreadRadius: 1)
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 60.0,
                            ),
                            CustomTextField(
                              hintText: 'الاسم',
                              controller: _usernameameController,
                              inputType: TextInputType.text,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 10),
                              ),
                              activeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 231, 231, 231),
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                              divider: true,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextField(
                              hintText: 'رقم الهاتف',
                              controller: _phoneController,
                              inputType: TextInputType.number,
                              prefixIcon: Icon(Icons.phone),
                              isNumber: true,
                              divider: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 10),
                              ),
                              activeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 231, 231, 231),
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextField(
                              hintText: 'البريد الإلكتروني',
                              controller: _emailController,
                              inputType: TextInputType.emailAddress,
                              prefixIcon: Icon(Icons.email),
                              isEnabled: false,
                              divider: false,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 10),
                              ),
                              activeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 231, 231, 231),
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.location_city,
                                        size: 20,
                                        color: Color(0xFF8B7C61),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'المدينة',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF8B7C61),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: AppConstants.cities
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF8B7C61),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: cityselect,
                                  onChanged: (value) {
                                    setState(() {
                                      cityselect = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 160,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFEFDF9),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0x1E15172B),
                                      ),
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Color(0xFF8B7C61)),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFEFDF9),
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0x1E15172B),
                                      ),
                                    ),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(5),
                                      thickness: MaterialStateProperty.all(6),
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            CustomTextField(
                              hintText: 'الرقم التعريفي',
                              controller: _identityController,
                              inputType: TextInputType.text,
                              prefixIcon: Icon(Icons.location_city),
                              divider: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 10),
                              ),
                              activeBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 231, 231, 231),
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            GetBuilder<AuthController>(builder: (auth) {
                              return auth.isLoading
                                  ? CircularProgressIndicator()
                                  : CustomButton(
                                      buttonText: 'حفظ',
                                      onPressed: () {
                                        _update(auth);
                                      },
                                    );
                            }),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        if (widget.model.image == 'null')
                          Positioned(
                            top: -60,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                    'assets/images/placeholder.jpg')),
                          ),
                        if (widget.model.image != 'null')
                          Positioned(
                            top: -60,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(widget.model.image!)),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _update(AuthController authController) async {
    String _username = _usernameameController.text.trim();
    String _email = _emailController.text.trim();
    String _number = _phoneController.text.trim();
    String _identity = _identityController.text.trim();

    if (_username.isEmpty) {
      showCustomSnackBar(context, 'Enter your username');
    } else if (_email.isEmpty) {
      showCustomSnackBar(context, 'Enter your email');
    } else if (_identity.isEmpty) {
      showCustomSnackBar(context, 'Enter your identity');
    } else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar(context, 'Enter correct email');
    } else if (_number.isEmpty) {
      showCustomSnackBar(context, 'enter_phone_number');
    } else if (cityselect == null) {
      showCustomSnackBar(context, 'Please select a city');
    } else {
      UserModel data = UserModel.withId(
        id: widget.model.id,
        username: _username,
        identity: _identity,
        user_type: AppConstants.userTypes[2],
        phone: _number,
        email: _email,
        city: cityselect,
      );

      authController.updateUserInfo(context, data).then((value) {
        Navigator.pop(context);
      });
    }
  }
}
