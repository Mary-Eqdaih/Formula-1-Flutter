import 'package:flutter/material.dart';
import 'package:formula1_fantasy/f1/data/models/about_f1_model.dart';
import 'package:formula1_fantasy/f1/presentation/widgets/aboutF1_widget.dart';

class aboutF1 extends StatelessWidget {
  const aboutF1({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBg = Color(0xFF0F0F10);
    List<AboutF1Model> aboutF1 = [
      AboutF1Model(
        title: 'Origins (1950)',
        body:
            '• Formula One is the top class of single-seater motor racing governed by the FIA.\n'
            '• The first World Championship season was in 1950 (opening race at Silverstone, UK).\n'
            '• The annual title is awarded to Drivers (since 1950) and Constructors (since 1958).',
      ),
      AboutF1Model(
        title: 'Eras at a glance',
        body:
            '• 1950s–60s  Front-engine → rear-engine cars; mechanical grip; legends like Fangio & Clark.\n'
            '• 1970s  Aerodynamics, wings, early ground effect; major safety improvements.\n'
            '• 1980s  Turbo era power; electronics rise; Senna vs. Prost rivalry.\n'
            '• 1990s  Refined aero & electronics; Schumacher dominance; active suspension ban.\n'
            '• 2000s  High downforce; V10 → V8; Ferrari golden age; refuelling era (now banned).\n'
            '• 2014–2021  1.6 L V6 turbo-hybrids; ERS systems define efficiency.\n'
            '• 2022 → New ground-effect aero rules for closer racing.',
      ),
      AboutF1Model(
        title: 'How a Grand Prix works',
        body:
            '• Fri: Practice sessions.\n'
            '• Sat: Qualifying (Q1→Q2→Q3) or Sprint Shootout + Sprint Race on Sprint weekends.\n'
            '• Sun: Grand Prix Race.\n'
            '• Tyres: Teams must balance performance vs. degradation; pit stops are strategic.\n'
            '• Points pay down to P10, plus a bonus for fastest lap (top 10 only).',
      ),
      AboutF1Model(
        title: 'Points system (current)',
        body:
            '• Grand Prix (top 10): 25 – 18 – 15 – 12 – 10 – 8 – 6 – 4 – 2 – 1.\n'
            '• Fastest Lap: +1 point (if in top 10).\n'
            '• Sprint (top 8): 8 – 7 – 6 – 5 – 4 – 3 – 2 – 1.\n'
            '• Constructors score combined points from both drivers.',
      ),
      AboutF1Model(
        title: 'Cars & Power Units over time',
        body:
            '• Chassis: Carbon-fibre monocoque, open-wheel & open-cockpit (with Halo since 2018).\n'
            '• Engines:\n'
            ' – 1950s–60s: Various NA engines (focus on reliability).\n'
            ' – 1977–1988: Turbocharged 1.5 L era.\n'
            ' – 1989–2005: NA 3.5 L → 3.0 L V10 engines.\n'
            ' – 2006–2013: 2.4 L V8 era.\n'
            ' – 2014–present: 1.6 L V6 turbo-hybrid with ERS.\n'
            '• 2022 rules revived ground effect for better racing.',
      ),
      AboutF1Model(
        title: 'Safety milestones',
        body:
            '• Tracks: Run-off areas, barriers, medical cars.\n'
            '• Driver gear: Fireproof suits, HANS device, Halo cockpit protection.\n'
            '• Cars: Stronger survival cell, wheel tethers.\n'
            '• Procedures: Safety Car, Virtual Safety Car, crash investigations improve each year.',
      ),
      AboutF1Model(
        title: 'Iconic teams',
        body:
            '• Ferrari – Oldest team; most Constructors’ titles.\n'
            '• McLaren – Multiple titles across eras; innovation leaders.\n'
            '• Williams – Privateer success story (80s-90s dominance).\n'
            '• Mercedes – Hybrid era giant (2014-2020 run).\n'
            '• Red Bull – Aero excellence & championship streaks 2010s → 2020s.',
      ),
      AboutF1Model(
        title: 'Legendary drivers (sample)',
        body:
            '• Juan Manuel Fangio – 5 titles in the 1950s.\n'
            '• Jim Clark – 60s icon of smooth speed.\n'
            '• Niki Lauda – Courageous comeback & safety advocate.\n'
            '• Alain Prost – “The Professor” of racecraft.\n'
            '• Ayrton Senna – Qualifying master; fierce rivalries.\n'
            '• Michael Schumacher – 7 titles; work ethic & dominance.\n'
            '• Lewis Hamilton – 7 titles; record wins & longevity.\n'
            '• Sebastian Vettel – 4 titles with Red Bull.\n'
            '• Fernando Alonso – Versatile and tactically brilliant.\n'
            '• Max Verstappen – Modern dominant force with Red Bull.',
      ),
      AboutF1Model(
        title: 'Records snapshot',
        body:
            '• Most Drivers’ titles: Michael Schumacher & Lewis Hamilton (7 each).\n'
            '• Most Grand Prix wins: Lewis Hamilton.\n'
            '• Most Constructors’ titles: Ferrari.\n'
            '• Youngest World Champion: Sebastian Vettel (23 yrs 134 days, 2010).',
      ),
      AboutF1Model(
        title: 'Circuits to know',
        body:
            '• Monaco – Narrow street circuit; ultimate precision test.\n'
            '• Monza – “Temple of Speed” in Italy.\n'
            '• Silverstone – Birthplace of the championship.\n'
            '• Spa-Francorchamps – Fast & flowing; weather drama.\n'
            '• Suzuka – Figure-eight technical classic (Japan).\n'
            '• Interlagos – Brazil; unpredictable & strategic.\n'
            '• Austin / Las Vegas – Modern US additions with showbiz flair.',
      ),
      AboutF1Model(
        title: 'Quick glossary',
        body:
            '• Downforce – Vertical load from aero giving grip at speed.\n'
            '• Dirty air – Turbulence reducing downforce for car behind.\n'
            '• DRS – Movable rear wing zone for overtaking.\n'
            '• Undercut / Overcut – Pit timing strategies to gain track position.\n'
            '• Understeer / Oversteer – Front slides vs rear steps out.\n'
            '• Parc fermé – Restricted setup after qualifying.\n'
            '• Marbles – Rubber debris off racing line → low grip.',
      ),
    ];

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: darkBg,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'About F1',
              style: TextStyle(
                fontFamily: "TitilliumWeb",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.sports_motorsports, color: Colors.white, size: 30),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: aboutF1.length,
        itemBuilder: (context, index) {
          return AboutF1Widget(model: aboutF1[index]);
        },
      ),
    );
  }
}
