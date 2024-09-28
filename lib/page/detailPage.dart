import 'package:daily_planner/Model/Task.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  final Task task;
  const Detailpage({super.key, required this.task});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết nhiệm vụ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Công việc: ${widget.task.taskContent!}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'Ngày:',
                        style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Text(
                        widget.task.day!,
                        style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
            ),
            Divider(
                  height: 20,
                  thickness: 1,
                  color: Theme.of(context).dividerColor,),
            Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'Thời Gian:',
                        style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Text(
                        widget.task.time!,
                        style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
            ),
            Divider(
                  height: 20,
                  thickness: 1,
                  color: Theme.of(context).dividerColor,),
            Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'Địa Điểm:',
                        style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Text(
                        widget.task.location!,
                        style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
            ),
            Divider(
                  height: 20,
                  thickness: 1,
                  color: Theme.of(context).dividerColor,),
            Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'Người chủ trì:',
                        style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Text(
                        widget.task.host!,
                        style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
            ),
             Divider(
                  height: 20,
                  thickness: 1,
                  color: Theme.of(context).dividerColor,),
            Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        'Ghi chú:',
                        style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Text(
                        widget.task.note!,
                        style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
            ),
            
          ],
        ),
      ),
    );
  }
}