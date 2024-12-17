import 'package:vania/vania.dart';

class CreatePelangganTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('pelanggan', () {
      char('user_id', length: 6);
      primary('user_id');
      string('user_nama', length: 75);
      string('user_username', length: 50);
      string('password', length: 50);
      text('user_alamat');
      string('user_kota');
      string('user_provinsi');
      string('user_negara');
      integer('user_notlp');
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('pelanggan');
  }
}
