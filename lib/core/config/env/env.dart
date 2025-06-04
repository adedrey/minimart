import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'INTERCOM_IOS_KEY', obfuscate: true, defaultValue: '')
  static final String intercomIosKey = _Env.intercomIosKey;
  @EnviedField(
    varName: 'INTERCOM_ANDROID_KEY',
    obfuscate: true,
    defaultValue: '',
  )
  static final String intercomAndroidKey = _Env.intercomAndroidKey;
  @EnviedField(varName: 'INTERCOM_ID', obfuscate: true, defaultValue: '')
  static final String intercomId = _Env.intercomId;
  @EnviedField(varName: 'DOJAH_ID', obfuscate: true, defaultValue: '')
  static final String dojahId = _Env.dojahId;
  @EnviedField(varName: 'DOJAH_KEY', obfuscate: true, defaultValue: '')
  static final String dojahKey = _Env.dojahKey;
  @EnviedField(varName: 'DOJAH_WIDGET_ID', obfuscate: true, defaultValue: '')
  static final String dojahWidgetId = _Env.dojahWidgetId;
  @EnviedField(varName: 'BOT_TOKEN', obfuscate: true, defaultValue: '')
  static final String botToken = _Env.botToken;
  @EnviedField(varName: 'BOT_CHAT_ID', obfuscate: true, defaultValue: '')
  static final String botChatId = _Env.botChatId;
}
