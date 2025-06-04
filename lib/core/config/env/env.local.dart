import 'package:envied/envied.dart';

part 'env.local.g.dart';

@Envied(path: '.env.dev')
abstract class EnvLocal {
  @EnviedField(varName: 'INTERCOM_IOS_KEY', obfuscate: true, defaultValue: '')
  static final String intercomIosKey = _EnvLocal.intercomIosKey;
  @EnviedField(
    varName: 'INTERCOM_ANDROID_KEY',
    obfuscate: true,
    defaultValue: '',
  )
  static final String intercomAndroidKey = _EnvLocal.intercomAndroidKey;
  @EnviedField(varName: 'INTERCOM_ID', obfuscate: true, defaultValue: '')
  static final String intercomId = _EnvLocal.intercomId;
  @EnviedField(varName: 'DOJAH_ID', obfuscate: true, defaultValue: '')
  static final String dojahId = _EnvLocal.dojahId;
  @EnviedField(varName: 'DOJAH_KEY', obfuscate: true, defaultValue: '')
  static final String dojahKey = _EnvLocal.dojahKey;
  @EnviedField(varName: 'DOJAH_WIDGET_ID', obfuscate: true, defaultValue: '')
  static final String dojahWidgetId = _EnvLocal.dojahWidgetId;
  @EnviedField(varName: 'BOT_TOKEN', obfuscate: true, defaultValue: '')
  static final String botToken = _EnvLocal.botToken;
  @EnviedField(varName: 'BOT_CHAT_ID', obfuscate: true, defaultValue: '')
  static final String botChatId = _EnvLocal.botChatId;
}
