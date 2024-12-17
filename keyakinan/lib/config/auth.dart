import 'package:keyakinan/app/models/pelanggan.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': Pelanggan(
        userId: 0, // Ganti dengan ID yang sesuai
        userUsername: 'defaultUsername', // Ganti dengan username yang sesuai
        userPassword: 'defaultPassword', // Ganti dengan password yang sesuai
      ),
    }
  }
};