import 'package:easy_fast/models/eatingRecord.dart';
import 'package:easy_fast/providers/eatingRecordProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EatingRecordProvider>(
      builder: (context, provider, _) {
        return buildListFromFuture(provider.getRecords());
      },
    );
  }

  Widget buildListFromFuture(Future data) {
    return FutureBuilder<List<EatingRecord>>(
        future: data,
        builder:
            (BuildContext context, AsyncSnapshot<List<EatingRecord>> snapshot) {
          Widget child;

          if (snapshot.hasData) {
            child = buildListView(snapshot.data);
          } else if (snapshot.hasError) {
            child = Text("Error loading data");
          } else {
            child = Container();
          }
          return Center(child: child);
        });
  }

  Widget buildListView(List<EatingRecord> records) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: records.length,
        itemBuilder: (BuildContext context, int index) {
          return buildRow(context, records[index], index);
        });
  }

  Widget buildRow(BuildContext context, EatingRecord rowData, int index) {
    return ListTile(
      title: Center(child: Text(DateFormat('hh:mm').format(rowData.timestamp))),
      onLongPress: () {
        showDeleteDialog(context, rowData.id);
      },
    );
  }

  showDeleteDialog(BuildContext context, int id) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Delete"),
      onPressed: () {
        Provider.of<EatingRecordProvider>(context, listen: false)
            .deleteById(id);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Delete Record?"),
      content: Text("Are you sure you want to delete?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// import 'history.dart';
// import 'historyModel.dart';

// class HistoryPage extends StatefulWidget {
//   HistoryPage({Key key}) : super(key: key);

//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   List<History> _history;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final historyState = Provider.of<HistoryState>(context);
//     _history = historyState.history;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HistoryState>(builder: (context, history, _) {
//       return ListView.builder(
//           padding: const EdgeInsets.all(8),
//           itemCount: _history.length,
//           itemBuilder: (BuildContext context, int index) {
//             return buildRow(context, history, index);
//           });
//     });
//   }

//   Widget buildRow(BuildContext context, HistoryState rowData, int index) {
//     return ListTile(
//       title: Center(
//           //child: Text(formatEntryText(rowData.atIndex(index).timestamp))),
//           child: Text(formatEntryText(rowData.atIndex(index).timestamp))),
//       onLongPress: () {
//         //Todo modal confirmation
//         //rowData.delete(index).then((value) => setState(() {}));
//         showDeleteDialog(context, rowData.atIndex(index).id);
//       },
//     );
//   }

//   String formatEntryText(DateTime timestamp) {
//     return DateFormat('hh:mm').format(timestamp);
//   }

//   showDeleteDialog(BuildContext context, int id) {
//     // set up the buttons
//     Widget cancelButton = FlatButton(
//       child: Text("Cancel"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//     Widget continueButton = FlatButton(
//       child: Text("Delete"),
//       onPressed: () {
//         _history.removeWhere((item) => item.id == id);
//         Provider.of<HistoryState>(context, listen: false).delete(id);
//         Navigator.of(context).pop();
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Delete Record?"),
//       content: Text("Are you sure you want to delete?"),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     ).then((value) => setState(() {}));
//   }
// }
