import 'package:vania/vania.dart';

class CreatePesananTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('pesanan', () {
      integer('pesan_no', length: 11);
      date('pesan_tgl');
      char('user_id');
      foreign('user_id', 'pelanggan', 'user_id');
      primary('pesan_no');
    });

    
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('pesanan');
    
  }
}
