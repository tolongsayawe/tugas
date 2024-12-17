import 'package:vania/vania.dart';

class CreateCbarangTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('cbarang', () {
      char('catat_id', length: 5);
      primary('catat_id');
      string('barang_id', length: 11);
      foreign('barang_id', 'barang', 'barang_id', constrained: true, onDelete: "CASCADE");
      date('catat_tgl');
      text('catat_text');
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('cbarang');
  }
}
