import 'package:daily_planner/Model/Theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themProvider.themeMode == ThemeMode.dark;
    return  Scaffold(
      
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 20,),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                        "assets/images/mylogo.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                ),
                const Padding(
                      padding:  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Text(
                        "username",
                        style: TextStyle(
                          letterSpacing: 0,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  
                Divider(
                  height: 10,
                  thickness: 1,
                  indent: 24,
                  endIndent: 24,
                  color: Theme.of(context).dividerColor
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'Chế độ Sáng/Tối',
                        style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                              letterSpacing: 0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      child: Switch(value: isDarkMode, onChanged: (value){
                        themProvider.toggleTheme(value);
                      }),
                    ),
                  ],
                ),
            
          ],
        ),
      ),
    );
  }
}