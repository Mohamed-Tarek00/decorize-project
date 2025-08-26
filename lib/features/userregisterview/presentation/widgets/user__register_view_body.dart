import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_navigation_button.dart';
import 'package:decorize_project/features/userregisterview/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserRegisterViewBody extends StatefulWidget {
  const UserRegisterViewBody({super.key});

  @override
  State<UserRegisterViewBody> createState() => _UserRegisterViewBodyState();
}

class _UserRegisterViewBodyState extends State<UserRegisterViewBody> {
  bool isAgreed = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(kMainLogo, height: 80.h, width: 70.w),
                Text('انشاء حساب', style: Styles.textStyle28),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  name: 'الاسم',
                  hintText: 'ادخل الاسم',
                  iconPath: 'assets/icons/profile.svg',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك ادخل الاسم';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  name: 'البريد الإلكتروني',
                  hintText: 'ادخل البريد الإلكتروني',
                  iconPath: 'assets/icons/sms.svg',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك ادخل البريد الإلكتروني';
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                    ).hasMatch(value)) {
                      return 'صيغة البريد الإلكتروني غير صحيحة';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  name: 'كلمة المرور',
                  hintText: 'ادخل كلمة المرور',
                  iconPath: 'assets/icons/lock.svg',
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل كلمة المرور';
                    } else if (value.length < 6) {
                      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  name: 'تأكيد كلمة المرور',
                  hintText: 'ادخل كلمة المرور مرة أخرى',
                  iconPath: 'assets/icons/lock.svg',
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'كلمة المرور غير متطابقة';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isAgreed = !isAgreed;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/tick-square.svg',
                          width: 20.w,
                          height: 20.h,
                          color: isAgreed ? Colors.blue : Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      ' الموافقه علي الشروط والاحكام',
                                      style: Styles.textStyle16.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف    إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                                      style: Styles.textStyle14,
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('موافق'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          'الموافقة على الشروط والأحكام',
                          style: Styles.textStyle14,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (isAgreed == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('يجب الموافقة على الشروط والأحكام'),
                          ),
                        );
                        return;
                      }
                      //ايه الي هيحصل بعد كده
                      print('Name: ${nameController.text}');
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                    }
                  },
                  text: 'انشاء حساب',
                ),
                CustomNavigationButton(
                  onPressed: () {},
                  solidText: 'لديك حساب؟',
                  navigationText: 'تسجيل الدخول',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
