// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To Suqia`
  String get welcome {
    return Intl.message(
      'Welcome To Suqia',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Where you can reach water Zamzam easily!`
  String get welcomeMessage {
    return Intl.message(
      'Where you can reach water Zamzam easily!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verifPageTitle {
    return Intl.message(
      'Verification',
      name: 'verifPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `VERIFY YOUR EMAIL ADDRESS`
  String get verifyEmail {
    return Intl.message(
      'VERIFY YOUR EMAIL ADDRESS',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email and enter the code below to verify your email.`
  String get emailCode {
    return Intl.message(
      'Please check your email and enter the code below to verify your email.',
      name: 'emailCode',
      desc: '',
      args: [],
    );
  }

  /// `The code will expire in 2 minutes.`
  String get codeTime {
    return Intl.message(
      'The code will expire in 2 minutes.',
      name: 'codeTime',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message(
      'Verify',
      name: 'verifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Visitor`
  String get visitor {
    return Intl.message(
      'Visitor',
      name: 'visitor',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get employee {
    return Intl.message(
      'Employee',
      name: 'employee',
      desc: '',
      args: [],
    );
  }

  /// `Tank List`
  String get tListTitle {
    return Intl.message(
      'Tank List',
      name: 'tListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get temperature {
    return Intl.message(
      'Temperature',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `Tank`
  String get tank {
    return Intl.message(
      'Tank',
      name: 'tank',
      desc: '',
      args: [],
    );
  }

  /// `Tank Information`
  String get tInfoTitle {
    return Intl.message(
      'Tank Information',
      name: 'tInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tank Number`
  String get tankNum {
    return Intl.message(
      'Tank Number',
      name: 'tankNum',
      desc: '',
      args: [],
    );
  }

  /// `Refill Count Per Day`
  String get refillCount {
    return Intl.message(
      'Refill Count Per Day',
      name: 'refillCount',
      desc: '',
      args: [],
    );
  }

  /// `Tank status`
  String get tStatus {
    return Intl.message(
      'Tank status',
      name: 'tStatus',
      desc: '',
      args: [],
    );
  }

  /// `Full`
  String get full {
    return Intl.message(
      'Full',
      name: 'full',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Cold`
  String get cold {
    return Intl.message(
      'Cold',
      name: 'cold',
      desc: '',
      args: [],
    );
  }

  /// `Locate`
  String get locate {
    return Intl.message(
      'Locate',
      name: 'locate',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get firstNameMessage {
    return Intl.message(
      'Enter your first name',
      name: 'firstNameMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get firstNameEmpty {
    return Intl.message(
      'Please enter your first name',
      name: 'firstNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get lastNameMessage {
    return Intl.message(
      'Enter your last name',
      name: 'lastNameMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get lastNameEmpty {
    return Intl.message(
      'Please enter your last name',
      name: 'lastNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailMessage {
    return Intl.message(
      'Enter your email',
      name: 'emailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email`
  String get emailEmpty {
    return Intl.message(
      'Please enter an email',
      name: 'emailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email must end with @suqia.com`
  String get emailErrorMes {
    return Intl.message(
      'Email must end with @suqia.com',
      name: 'emailErrorMes',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passMessage {
    return Intl.message(
      'Enter your password',
      name: 'passMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get passEmpty {
    return Intl.message(
      'Please enter a password',
      name: 'passEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be longer than 6 characters`
  String get passShort {
    return Intl.message(
      'Password must be longer than 6 characters',
      name: 'passShort',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get passConf {
    return Intl.message(
      'Confirm Password',
      name: 'passConf',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get passConfHint {
    return Intl.message(
      'Confirm your password',
      name: 'passConfHint',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message(
      'Sign Up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get haveAcc {
    return Intl.message(
      'Already have an account? ',
      name: 'haveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get logInButton {
    return Intl.message(
      'Login',
      name: 'logInButton',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setTitle {
    return Intl.message(
      'Settings',
      name: 'setTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Logout Successfully`
  String get logOutMes {
    return Intl.message(
      'Logout Successfully',
      name: 'logOutMes',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassTittle {
    return Intl.message(
      'Reset Password',
      name: 'resetPassTittle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPass {
    return Intl.message(
      'New Password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Rewrite New Password`
  String get reNewPass {
    return Intl.message(
      'Rewrite New Password',
      name: 'reNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password Successfully`
  String get resetPassSuc {
    return Intl.message(
      'Reset Password Successfully',
      name: 'resetPassSuc',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNum {
    return Intl.message(
      'Phone Number',
      name: 'phoneNum',
      desc: '',
      args: [],
    );
  }

  /// `Information Updated Successfully`
  String get infoUpdate {
    return Intl.message(
      'Information Updated Successfully',
      name: 'infoUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Suqia Privacy Policy`
  String get priTittle {
    return Intl.message(
      'Suqia Privacy Policy',
      name: 'priTittle',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get intro {
    return Intl.message(
      'Introduction',
      name: 'intro',
      desc: '',
      args: [],
    );
  }

  /// `This privacy policy applies to our mobile application. It explains how we collect, use, and protect your personal information when you use Suqia.`
  String get introPri {
    return Intl.message(
      'This privacy policy applies to our mobile application. It explains how we collect, use, and protect your personal information when you use Suqia.',
      name: 'introPri',
      desc: '',
      args: [],
    );
  }

  /// `Information Collection:`
  String get infoCollect {
    return Intl.message(
      'Information Collection:',
      name: 'infoCollect',
      desc: '',
      args: [],
    );
  }

  /// `When you use our app, we may collect certain information, such as your device\'s unique identifier, location data, and app usage statistics.`
  String get infoCollection {
    return Intl.message(
      'When you use our app, we may collect certain information, such as your device\\\'s unique identifier, location data, and app usage statistics.',
      name: 'infoCollection',
      desc: '',
      args: [],
    );
  }

  /// `Use of Information:`
  String get infoUse {
    return Intl.message(
      'Use of Information:',
      name: 'infoUse',
      desc: '',
      args: [],
    );
  }

  /// `We use the information we collect to improve our app\'s functionality and provide you with a personalized experience.`
  String get infoUsage {
    return Intl.message(
      'We use the information we collect to improve our app\\\'s functionality and provide you with a personalized experience.',
      name: 'infoUsage',
      desc: '',
      args: [],
    );
  }

  /// `Information Sharing:`
  String get infoShar {
    return Intl.message(
      'Information Sharing:',
      name: 'infoShar',
      desc: '',
      args: [],
    );
  }

  /// `We do not share your personal information with third parties for marketing purposes.`
  String get infoSharege {
    return Intl.message(
      'We do not share your personal information with third parties for marketing purposes.',
      name: 'infoSharege',
      desc: '',
      args: [],
    );
  }

  /// `Data Retention:`
  String get dataReten {
    return Intl.message(
      'Data Retention:',
      name: 'dataReten',
      desc: '',
      args: [],
    );
  }

  /// `We retain your location information for as long as necessary to fulfill the purposes outlined in this policy unless a longer retention period is required or permitted by law.`
  String get dataRetention {
    return Intl.message(
      'We retain your location information for as long as necessary to fulfill the purposes outlined in this policy unless a longer retention period is required or permitted by law.',
      name: 'dataRetention',
      desc: '',
      args: [],
    );
  }

  /// `Last Update: 2023/09/25`
  String get lastUpd {
    return Intl.message(
      'Last Update: 2023/09/25',
      name: 'lastUpd',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get mapTittle {
    return Intl.message(
      'Map',
      name: 'mapTittle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginPage {
    return Intl.message(
      'Login',
      name: 'loginPage',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get passForget {
    return Intl.message(
      'Forgot Password?',
      name: 'passForget',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get loginError {
    return Intl.message(
      'Invalid email or password',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account? `
  String get noAccount {
    return Intl.message(
      'Don\\\'t have an account? ',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get lanSelect {
    return Intl.message(
      'Select Language',
      name: 'lanSelect',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lanEn {
    return Intl.message(
      'English',
      name: 'lanEn',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get lanAr {
    return Intl.message(
      'Arabic',
      name: 'lanAr',
      desc: '',
      args: [],
    );
  }

  /// `Language Changed Successfully`
  String get langMessg {
    return Intl.message(
      'Language Changed Successfully',
      name: 'langMessg',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get lanChange {
    return Intl.message(
      'Change Language',
      name: 'lanChange',
      desc: '',
      args: [],
    );
  }

  /// `Resetting Password`
  String get passRest {
    return Intl.message(
      'Resetting Password',
      name: 'passRest',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to send you a code to start the process of resetting your password.`
  String get sendEmail {
    return Intl.message(
      'Please enter your email to send you a code to start the process of resetting your password.',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `For enquirers and support:`
  String get enquirers {
    return Intl.message(
      'For enquirers and support:',
      name: 'enquirers',
      desc: '',
      args: [],
    );
  }

  /// `At Suqia we are passionate about improving your experience in the holy mosques.`
  String get about {
    return Intl.message(
      'At Suqia we are passionate about improving your experience in the holy mosques.',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `We will help you arrive to Zamzm water tanks by using your direction settings to guide you for the nearest Zamzm water tank based on your specifications with the highest quality and the easiest way.`
  String get aboutSuqia {
    return Intl.message(
      'We will help you arrive to Zamzm water tanks by using your direction settings to guide you for the nearest Zamzm water tank based on your specifications with the highest quality and the easiest way.',
      name: 'aboutSuqia',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
