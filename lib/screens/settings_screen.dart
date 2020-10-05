import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();
  @override
  Widget build(BuildContext context) {
    Widget _createSwitch(
        String title, String subtitle, bool value, Function onChanged) {
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: [
              _createSwitch(
                'Sem Glutén',
                'Só exibir refeições sem glúten',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'Só exibir refeições sem Lactose',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Só vegana',
                'Só exibir refeições veganas',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                'Só vegetariana',
                'Só exibir refeições vegetarianas',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
