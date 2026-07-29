# dc-motor-generator-simulink-validation

# DC Motor-Flywheel-Generator System: Simulation & Experimentelle Validierung

Dieses Repository enthält ein MATLAB/Simulink-Simulationsmodell sowie die experimentelle Validierung eines gekoppelten Gleichstrommotor–Schwungscheibe–Generator-Systems. Das Projekt wurde im Rahmen des Labors *Modellbildung & Simulation* an der Hochschule Bremen (HSB) durchgeführt.

---

## Projektüberblick

Ziel dieses Projekts ist die mathematische Modellierung, Simulation und experimentelle Validierung des dynamischen Verhaltens eines elektromechanischen Systems bestehend aus:
- Einem **Gleichstrommotor** zur Umwandlung elektrischer Energie in mechanisches Drehmoment.
- Einer **Schwungscheibe** auf der gemeinsamen Welle zur Speicherung kinetischer Energie und Dämpfung von Lastschwankungen.
- Einem **Gleichstromgenerator**, der die kinetische Energie zurück in elektrische Energie wandelt und eine elektrische Last (Glühlampe / ohmscher Verbraucher) versorgt.

Die Simulationsergebnisse wurden mit realen Messdaten abgeglichen, die über eine CodeSys I/O-Messbox an einem Laborprüfstand erfasst wurden.

---

## Systemarchitektur & Mathematisches Modell

Die kontinuierliche Zustandsraumdarstellung basiert auf drei zentralen Zustandsgrößen:
- **$i_A$**: Motor-Ankerstrom $[A]$
- **$i_G$**: Generator-Laststrom $[A]$
- **$\omega$**: Winkelgeschwindigkeit $[rad/s]$

### Zustandsgleichungen
$$
\begin{aligned}
\frac{di_A}{dt} &= \frac{1}{L_A} \left( U_A - R_A i_A - K_M \omega \right) \\[2mm]
\frac{di_G}{dt} &= \frac{1}{L_A} \left( K_M \omega - (R_A + R_L) i_G \right) \\[2mm]
\frac{d\omega}{dt} &= \frac{K_M i_A - K_M i_G - d \cdot \omega}{\Theta_{ges}}
\end{aligned}
$$

*Parameter:*
- $U_A$: Motor-Eingangsspannung $[V]$
- $R_A, L_A$: Ankerwiderstand $[\Omega]$ und Ankerinduktivität $[H]$
- $K_M$: Drehmoment- bzw. Motorspezifische Konstante $[Nm/A]$
- $R_L$: Lastwiderstand $[\Omega]$
- $d$: Viskoser Reibungskoeffizient $[Nm \cdot s / rad]$
- $\Theta_{ges}$: Gesamtes Massenträgheitsmoment ($\Theta_M + \Theta_{Schwungscheibe} + \Theta_G$) $[kg \cdot m^2]$

---

## Simulink-Modell

Die Differentialgleichungen wurden in MATLAB/Simulink mittels Integrator-Blöcken und kontinuierlicher Zustandsrückführung umgesetzt, um die physikalische Kopplung abzubilden:

![Simulink Blockschaltbild](docs/Simulink_Blockschaltbild.png)


---

## Wichtigste Ergebnisse & Erkenntnisse

1. **Sprungantwort & Übergangsverhalten:**
   - Beim Anlauf tritt aufgrund der fehlenden Gegen-EMK ($\omega = 0$) ein Ankerstrompeak auf, der mit steigender Drehzahl exponentiell abfällt.
   - Beim Abschalten der Versorgungsspannung wird der Strom negativ, da die in der Schwungscheibe gespeicherte kinetische Energie den Motor kurzzeitig als Generator antreibt.

2. **Lastsprung-Analyse:**
   - Das Zuschalten einer zusätzlichen elektrischen Last auf der Generatorseite bei $t = 10s$ erhöht die Wirkleistungsabgabe (~1,4W auf ~2,7W), was zu einem spürbaren Abfall der Drehzahl führt (~3500 U/min auf ~3300 U/min).

3. **Abweichungen zwischen Simulation und Realität:**
   - **Quantisierung & Rauschen:** Reale Messungen zeigen Quantisierungseffekte des A/D-Wandlers sowie Signalrauschen.
   - **Nichtlinearitäten der Last:** Glühlampen und LEDs zeigen temperaturabhängige, nichtlineare Widerstandsverläufe, die von einem einfachen ohmschen Widerstand ($R_L$) nicht vollständig abgebildet werden.
   - **Hardware-Grenzen:** Eine Sättigung der analogen Eingangskarte bei $10V$ begrenzt die Erfassung von Spannungspitzen bei Tests mit höheren Eingangsspannungen.

---

## Ausführung der Simulation

1. **Voraussetzungen:** MATLAB & Simulink (R2020b oder neuer empfohlen).
2. Repository klonen:
   ```bash
   git clone [https://github.com/christiankwamegni10-debug/dc-motor-generator-simulink-validation.git](https://github.com/christiankwamegni10-debug/dc-motor-generator-simulink-validation.git)

   
