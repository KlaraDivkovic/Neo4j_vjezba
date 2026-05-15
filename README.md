# Neo4j_vjezba
Projekt predstavlja rad u Neo4j bazi podataka koristeći Cypher upite i graf prikaz podataka. Kroz projekt su napravljeni različiti upiti, relacije između čvorova i prikaz rezultata u Neo4j Browseru.

Pokretanje projekta:
Za pokretanje projekta potrebno je imati instaliran Docker Desktop.
Nakon toga u terminal upisati:
docker compose up -d
te Neo4j Browser otvariti na lokaciji: http://localhost:7474

Prijava se vrši podacima koji se nalaze u docker-compose.yml datoteci.

U repozitoriju se nalazi:
docker-compose.yml – datoteka za pokretanje Neo4j baze
queries.cypher – svi korišteni upiti iz zadatka
ODGOVORI.md – odgovori na zadana pitanja iz zadataka
Screenshots/ – screenshotovi rada baze i rezultata upita

U projektu su napravljeni:
unos čvorova i relacija
povezivanje osoba, filmova i gradova
različiti upiti
rad s indeksima i constraintima
prikaz grafa i rezultata u Neo4j Browseru
