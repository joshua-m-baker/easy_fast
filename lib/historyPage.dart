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
