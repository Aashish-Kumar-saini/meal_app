
import 'package:flutter/material.dart';

enum Filter{
  gulteanFree,
  lactoseFree,
  vegitarian,
  vegan
}

class Filtersscreen extends StatefulWidget {
  const Filtersscreen({super.key, required this.currentFilter});

  final Map<Filter,bool> currentFilter;
  @override
  State<Filtersscreen> createState() => _FiltersscreenState();
}

class _FiltersscreenState extends State<Filtersscreen> {
  bool _gultenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    _gultenFreeFilterSet = widget.currentFilter[Filter.gulteanFree] ?? false;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree] ?? false;
    _vegFilterSet = widget.currentFilter[Filter.vegitarian] ?? false;
    _veganFilterSet = widget.currentFilter[Filter.vegan] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(onSelectScreen: (screen){
      //   Navigator.of(context).pop();
      //   if(screen == "meals"){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const TabsScreen()));
      //   }
      // } ),
      appBar: AppBar(
        title: const Text("Your Filters")),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.gulteanFree : _gultenFreeFilterSet,
            Filter.lactoseFree : _lactoseFreeFilterSet,
            Filter.vegan : _veganFilterSet,
            Filter.vegitarian : _vegFilterSet
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gultenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _gultenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gulten-free',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text("Only contains Gulten-free meals", style:  Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),),
                    activeThumbColor: Theme.of(context).colorScheme.tertiary,
                    contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text("Only contains Lactose-free meals", style:  Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),),
                    activeThumbColor: Theme.of(context).colorScheme.tertiary,
                    contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text("Only contains Vegetarian meals", style:  Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),),
                    activeThumbColor: Theme.of(context).colorScheme.tertiary,
                    contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text("Only contains Vegan meals", style:  Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),),
                    activeThumbColor: Theme.of(context).colorScheme.tertiary,
                    contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          
          ],
        ),
      ),
    );
  }
}
