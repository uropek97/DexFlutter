abstract class Document{

  void save(String path, String info);
}

class _DocumentXML implements Document {
  @override
  void save(String path, String info){
    print('Запись:${info} в файл формата PDF');
  }
}
class _DocumentJSON implements Document{
  @override
  void save(String path, String info){
    print('Запись:${info} в файл формата JSON');
  }
}

class _DocumentTXT implements Document{
  @override
  void save(String path, String info){

  }
}

class DocumentFactory implements Document{
  Document createDocument(String path){
    var pathFormat = path.split('.');
    String format = pathFormat[pathFormat.length - 1];
    switch(format){
      case 'xml':
        return _DocumentXML();
      case 'json':
        return _DocumentJSON();
      case 'txt':
        return _DocumentTXT();
      default:
        throw Exception('Неподдерживаемый формат');
    }
  }
  @override
  void save(String path, String info){
    var doc = createDocument(path);

    doc.save(path, info);
    print(doc.runtimeType);
  }
}
