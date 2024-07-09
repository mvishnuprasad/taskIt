// class EventsListWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Events List'),
//       ),
//       body: ListView.builder(
//         itemCount: events.length,
//         itemBuilder: (context, index) {
//           final event = events[index];
//           return ListTile(
//             title: Text(event.title),
//             subtitle: Text(
//               '${event.startTime.hour}:${event.startTime.minute} - ${event.endTime.hour}:${event.endTime.minute}',
//             ),
//             // You can add more details or customize the ListTile as needed
//           );
//         },
//       ),
//     );
//   }
// }
