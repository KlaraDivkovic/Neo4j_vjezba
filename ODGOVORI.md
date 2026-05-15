Zadatak 1
-Koja su dva porta koja Neo4j eksponira i čemu koji služi?
-Neo4j koristi port 7474 za Neo4j Browser, odnosno web sučelje preko kojeg možemo pisati i izvršavati Cypher upite te pregledavati graf.  
Port 7687 koristi Bolt protokol koji služi za povezivanje aplikacija i drivera s Neo4j bazom podataka.


Zadatak 2
-Objasniti razliku između CREATE i MERGE u Neo4ju
-CREATE uvijek kreira novi čvor ili novu vezu bez obzira postoji li već isti zapis u bazi, a MERGE prvo provjerava postoji li traženi element, te ako ne postoji tek ga onda kreira. Zato se MERGE često koristi kako bi se izbjegli duplikati u grafu.


Zadatak 4
-Objasniti razliku između MATCH i OPTIONAL MATCH
-MATCH vraća samo one čvorove koji imaju traženu vezu ili odgovaraju zadanim uvjetima.OPTIONAL MATCH vraća i čvorove koji nemaju vezu, ali tada umjesto rezultata dobivamo null vrijednosti.


Zadatak 5
-Što se dogodi ako shortestPath ne pronađe put između dva čvora i što vraća upit?
-Ako shortestPath ne pronađe put između dva čvora, Neo4j ne može vratiti path objekt.U tom slučaju rezultat upita je null odnosno ne vraća se nijedan pronađeni put.