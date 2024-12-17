import 'package:vania/vania.dart';

class CreateVendorsTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('vendors', () {
      char('vend_id', length: 10);
      string('vend_nama', length: 50);
      text('vend_alamat');
      text('vend_kota');
      text('vend_provinsi');
      string('vend_zip');
      text('vendor_negara');
      primary('vend_id');
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('vendors');
  }
}
