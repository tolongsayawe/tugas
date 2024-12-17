import 'package:vania/vania.dart';

class CreatePbarangTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('pbarang', () {
      integer('pbarang_barang', length: 11);
      string('barang_id', length: 11);
      integer('pesan_no', length: 11);
      integer('quantity', length: 11);
      integer('size', length: 11);
      foreign('pesan_no', 'pesanan', 'pesan_no');
      foreign('barang_id', 'barang', 'barang_id', constrained: true, onDelete: "CASCADE");
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('pbarang');
  }
}
