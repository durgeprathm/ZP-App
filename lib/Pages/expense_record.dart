import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zpapp/Constant/const.dart';
import 'package:zpapp/Pages/expense_form.dart';


class ExpenseRecord extends StatefulWidget {
  @override
  _ExpenseRecordState createState() => _ExpenseRecordState();
}

class _ExpenseRecordState extends State<ExpenseRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Record"),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return ExpensesForm();
                  }));
                },
                child: FaIcon(FontAwesomeIcons.plus),
              ),
            ),
          ),
        ],
      ),
      body:  Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, int index) {
                return HomeOptions(index +1);
              }
          ),
        ),
      ),
    );
  }
}
class HomeOptions extends StatelessWidget {
  HomeOptions(this.index);
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Primarycolur,
              width: 2,
            )
        ),
        child: ListTile(
          title: Padding(
              padding: EdgeInsets.only(left:15.5,bottom: 5.0,top: 15.5,right: 10.5),
              child: Text("Expenses $index" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          subtitle: Padding(
            padding: const EdgeInsets.only(left:15.5,bottom: 5.0,top: 5,right: 10.5),
            child: Text("Amount ${ruppe}300"),
          ),
          onTap: () {
          },
        ),
      ),
    );
  }
}
