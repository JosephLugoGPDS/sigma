import 'package:flutter/material.dart';
import 'package:sigma/utils/color_util.dart';
import 'package:sigma/widgets/button_widget.dart';
import 'package:sigma/widgets/search_field_widget.dart';

class CitasView extends StatelessWidget {
  const CitasView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController searchControllerLeft = TextEditingController();
    final TextEditingController searchControllerRight = TextEditingController();

    return DefaultTabController(
      length: 2, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtil.primaryAccent,
          title: Text(
            'Citas',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: ColorUtil.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.medical_information),
                  text: "Pendientes"), // replace with your icon and title
              Tab(
                  icon: Icon(Icons.delete),
                  text: "Anuladas"), // replace with your icon and title
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Actives
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SearchField(
                    hint: 'Buscar',
                    searchController: searchControllerLeft,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const CitaCard(
                          isActive: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Inactives
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SearchField(
                    hint: 'Buscar',
                    searchController: searchControllerLeft,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        return const CitaCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CitaCard extends StatelessWidget {
  const CitaCard({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CitaItem(
                title: 'Fecha',
                subtitle: '10/10/2024',
              ),
              CitaItem(
                title: 'Hora',
                subtitle: '10:24',
              ),
              CitaItem(
                isLast: true,
                title: 'Doctor',
                subtitle: 'Doctor Adam Smith XXX XXX',
                isExpanded: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: isActive
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              const CitaItem(
                title: 'Dentista infantil',
                subtitle: 'Dentista',
              ),
              // if (!isActive) const SizedBox(width: 20),
              const CitaItem(
                title: 'Ciudad',
                subtitle: 'Ciudad XXXX',
              ),
              isActive
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ButtonWidget(
                        title: 'Cancelar',
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    ));
  }
}

class CitaItem extends StatelessWidget {
  const CitaItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.isExpanded = false,
    this.isLast = false,
  });
  final String title;
  final String subtitle;
  final bool isExpanded;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: !isLast ? 100 : null,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorUtil.gray,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        isExpanded
            ? SizedBox(
                width: width - 80 - 200,
                child: Text(
                  subtitle,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorUtil.primaryAccent,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            : Text(
                subtitle,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorUtil.primaryAccent,
                      fontWeight: FontWeight.bold,
                    ),
              ),
      ],
    );
  }
}
