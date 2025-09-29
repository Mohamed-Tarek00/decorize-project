import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/utils/validator.dart';
import 'package:decorize_project/core/widgets/custom_navigation_button.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/governorate.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/city_cubit/cubit/city_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/city_dropdown.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/governorate_dropdown.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/job_dropdown.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/registration_process.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/show_modal_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class UserRegisterViewBody extends StatefulWidget {
  const UserRegisterViewBody({
    super.key,
    required this.role,
    required this.position,
  });
  final String role;
  final Position? position;

  @override
  State<UserRegisterViewBody> createState() => _UserRegisterViewBodyState();
}

class _UserRegisterViewBodyState extends State<UserRegisterViewBody> {
  bool isAgreed = false;
  Governorate? selectedGovernorate;
  City? selectedCity;
  Job? selectedJob;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                  validator: Validator.nameValidator,
                ),
                CustomTextFormField(
                  name: 'البريد الإلكتروني',
                  hintText: 'ادخل البريد الإلكتروني',
                  iconPath: 'assets/icons/sms.svg',
                  controller: emailController,
                  validator: Validator.emailValidator,
                ),
                CustomTextFormField(
                  name: ' رقم الهاتف',
                  hintText: 'ادخل رقم الهاتف',
                  iconPath: 'assets/icons/phone.svg',
                  controller: phoneController,
                  validator: Validator.phoneValidator,
                ),
                CustomTextFormField(
                  name: 'كلمة المرور',
                  hintText: 'ادخل كلمة المرور',
                  iconPath: 'assets/icons/lock.svg',
                  controller: passwordController,
                  validator: Validator.passwordValidator,
                ),
                CustomTextFormField(
                  name: 'تأكيد كلمة المرور',
                  hintText: 'ادخل كلمة المرور مرة أخرى',
                  iconPath: 'assets/icons/lock.svg',
                  controller: confirmPasswordController,
                  validator: (value) => Validator.confirmPasswordValidator(
                    value,
                    passwordController.text.trim(),
                  ),
                ),
                widget.role == 'worker'
                    ? JobDropdown(
                        onChanged: (job) {
                          setState(() {
                            selectedJob = job;
                          });
                        },
                        selectedJob: selectedJob,
                      )
                    : SizedBox.shrink(),
                GovernorateDropdown(
                  selectedGovernorate: selectedGovernorate,
                  onChanged: (gov) {
                    setState(() {
                      selectedGovernorate = gov;
                      selectedCity = null;
                    });
                    if (gov != null) {
                      context.read<CityCubit>().fetchCities(gov.id);
                    }
                  },
                ),
                selectedGovernorate == null
                    ? SizedBox.shrink()
                    : CityDropdown(
                        onChanged: (city) {
                          setState(() {
                            selectedCity = city;
                          });
                        },
                        selectedCity: selectedCity,
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
                          color: isAgreed ? kPrimaryColor : Colors.grey,
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
                              return ShowModalButtonSheet();
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
                registrationProcess(
                  emailController: emailController,
                  formKey: _formKey,
                  passwordController: passwordController,
                  nameController: nameController,
                  isAgreed: isAgreed,
                  phoneController: phoneController,
                  role: widget.role,
                  job: selectedJob,
                  city: selectedCity,
                  governorate: selectedGovernorate,
                ),
                CustomNavigationButton(
                  onPressed: () {
                    // context.pushReplacement(
                    //   AppRouterNames.loginView,
                    //   extra: {'type': widget.role, 'position': widget.position},
                    // );
                    context.go(AppRouterNames.userNavigationBar);
                  },
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
