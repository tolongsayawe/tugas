import 'package:vania/vania.dart';

class CreateBarangTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('barang', () {
      primary('barang_id');
      string('barang_id', length: 11);
      char('vend_id', length: 10);
      foreign('vend_id', 'vendors', 'vend_id', constrained: true, onDelete: "CASCADE");
      string('barang_nama', length: 30);
      integer('barang_harga', length: 20);
      text('barang_deskripsi');
      
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('barang');
  }
}
