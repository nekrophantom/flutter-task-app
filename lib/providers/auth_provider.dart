import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/services/auth_services.dart';

final authProvider = Provider<AuthService>((ref) => AuthService());