import 'package:mason/mason.dart';

enum Platform {
  android,
  ios,
}

void run(HookContext context) {
  context.vars['application_id_android'] =
      _appId(context, platform: Platform.android);
  context.vars['application_id'] = _appId(context);
}

String _appId(HookContext context, {Platform? platform}) {
  final orgName = context.vars['org_name'] as String;
  final projectName = context.vars['project_name'] as String;

  var applicationId = context.vars['application_id'] as String;

  if (_isNameCompleted(applicationId)){
    return applicationId;
  }

  applicationId = '''$orgName.${platform == Platform.android ? projectName.snakeCase : projectName.paramCase}''';
  return applicationId;
}

bool _isNameCompleted(String applicationId) {
  List<String> android_parts = applicationId.split('.');
  List<String> ios_parts = applicationId.split('-');
  return android_parts.length == 3 || ios_parts.length == 3;
}