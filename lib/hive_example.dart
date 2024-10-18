
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CrudOps extends StatefulWidget {
  const CrudOps({super.key});

  @override
  State<CrudOps> createState() => _CrudOpsState();
}

class _CrudOpsState extends State<CrudOps> {

  List myHiveData=[];
  
 
  
   @override
  void initState() {
    super.initState();
    _loadData();
  }


 void _loadData() async {
    var box = await Hive.openBox('myBox');
    setState(() {
      myHiveData = box.get('dataList', defaultValue: []) ?? [];
    });
  }
  
  void _addData() async {
    var newData={'name':'New User', 'email':'newuser@example.com'};

    setState(() {
      myHiveData.add(newData);
    });

    var box=await Hive.openBox('myBox');
    await box.put('dataList', 'myHiveData');
  }

  void _editData(int index) async{
    var updatedData={'name':'Updated User', 'email':'updatedUser@example.com'};
    setState(() {
      myHiveData[index]=updatedData;
    });
    var box=await Hive.openBox('myBox');
    await box.put('dataList', myHiveData);
  }

  void _deleteData(int index) async{
    setState(() {
      myHiveData.removeAt(index);
      });

      var box=await Hive.openBox('myBox');
      await box.put('dataList', myHiveData);
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Operations'),
        actions: [
          IconButton(onPressed: _loadData, icon: Icon(Icons.refresh))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: _addData, label: Text('Add Data'),icon: Icon(Icons.add),),
      body: Padding(padding: EdgeInsets.all(8),
      child: myHiveData.isEmpty?
      const Center(child: Text('No Data is stored yet...!!!'),)
      :
      ListView.builder(
       itemCount: myHiveData.length,
       itemBuilder: (context, index){
        final userData=myHiveData[index];
        return Card(
          child: ListTile(
            title: Text('Name: ${userData['name']}'),
            subtitle: Text('Email: ${userData['email']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: ()=>_editData(index), icon: Icon(Icons.edit)),
                IconButton(onPressed: ()=>_deleteData(index), icon: Icon(Icons.delete))
              ],
            ),
          ),
        );
      })
      ),

    );
  }
}