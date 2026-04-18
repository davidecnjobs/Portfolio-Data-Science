# Software gestionale per negozio di prodotti vegani
BioMarket s.a.s ti assume per sviluppare un piccolo software gestionale per la loro nuova bottega in Via Tan 6. Il software deve avere le seguenti funzionalità: Registrare nuovi prodotti, con nome, quantità, prezzo di vendita e prezzo di acquisto.

* Elencare tutti i prodotti presenti.
* Registrare le vendite effettuate.
* Mostrare i profitti lordi e netti.
* Mostrare un menu di aiuto con tutti i comandi disponibili.

Il software è testuale, quindi utilizzabile da riga di comando.

## Esempio di interazione con il programma
Inserisci un comando: aiuto </br>
I comandi disponibili sono i seguenti: </br>
aggiungi: aggiungi un prodotto al magazzino </br>
elenca: elenca i prodotto in magazzino </br>
vendita: registra una vendita effettuata </br>
profitti: mostra i profitti totali </br>
aiuto: mostra i possibili comandi </br>
chiudi: esci dal programma </br>


Inserisci un comando: aggiungi </br>
Nome del prodotto: latte di soia </br>
Quantità: 20 </br>
Prezzo di acquisto: 0.80 </br>
Prezzo di vendita: 1.40 </br>
AGGIUNTO: 20 X latte di soia </br>


Inserisci un comando: aggiungi </br>
Nome del prodotto: tofu </br>
Quantità: 10 </br>
Prezzo di acquisto: 2.20 </br>
Prezzo di vendita: 4.19 </br>
AGGIUNTO: 10 X tofu </br> 


Inserisci un comando: aggiungi </br>
Nome del prodotto: seitan </br>
Quantità: 5 </br>
Prezzo di acquisto: 3 </br>
Prezzo di vendita: 5.49 </br>
AGGIUNTO: 5 X seitan </br>


Inserisci un comando: elenca </br>
PRODOTTO    QUANTITA'   PREZZO </br>
latte di soia   20  €1.4 </br>
tofu    10  €4.19 </br>
seitan  5   €5.49 </br>


Inserisci un comando: vendita </br>
Nome del prodotto: latte di soia </br>
Quantità: 5 </br>
Aggiungere un altro prodotto ? (si/no): si </br>
Nome del prodotto: tofu </br> 
Quantità: 2 </br>
Aggiungere un altro prodotto ? (si/no): no </br>
VENDITA REGISTRATA </br>
* 5 X latte di soia: €1.40 </br> 
* 2 X tofu: €4.19 </br>
Totale: €15.38 </br>


Inserisci un comando: elenca </br>
PRODOTTO        QUANTITA'   PREZZO </br>
latte di soia   15          €1.4 </br>
tofu            8           €4.19 </br>
seitan          5           €5.49 </br>


Inserisci un comando: vendita </br>
Nome del prodotto: seitan </br>
Quantità: 5 </br>
Aggiungere un altro prodotto ? (si/no): no </br>
VENDITA REGISTRATA </br>
5 X seitan: €5.49 </br>
Totale: €27.45 </br>


Inserisci un comando: elenca </br>
PRODOTTO        QUANTITA'   PREZZO </br>
latte di soia   15          €1.4 </br>
tofu            8           €4.19 </br>


Inserisci un comando: profitti </br>
Profitto: lordo=€42.83 netto=€19.43 </br>


Inserisci un comando: storna </br>
Comando non valido </br>
I comandi disponibili sono i seguenti: </br>
aggiungi: aggiungi un prodotto al magazzino </br>
elenca: elenca i prodotto in magazzino </br>
vendita: registra una vendita effettuata </br>
profitti: mostra i profitti totali </br>
aiuto: mostra i possibili comandi </br>
chiudi: esci dal programma </br>


Inserisci un comando: chiudi </br>
Bye bye </br>
 