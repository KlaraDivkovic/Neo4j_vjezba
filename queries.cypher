ZADATAK 1 — PROVJERA OKRUŽENJA
RETURN 'Neo4j radi!' AS poruka;


2. ZADATAK — KREIRANJE ČVOROVA
// Filmovi
CREATE (f1:Film {naslov: 'Inception', godina: 2010, ocjena: 8.8, zanr: 'sci-fi'});
CREATE (f2:Film {naslov: 'The Dark Knight', godina: 2008, ocjena: 9.0, zanr: 'akcija'});
CREATE (f3:Film {naslov: 'Interstellar', godina: 2014, ocjena: 8.6, zanr: 'sci-fi'});
CREATE (f4:Film {naslov: 'Parasite', godina: 2019, ocjena: 8.6, zanr: 'triler'});
CREATE (f5:Film {naslov: 'The Godfather', godina: 1972, ocjena: 9.2, zanr: 'drama'});
CREATE (f6:Film {naslov: 'Memento', godina: 2000, ocjena: 8.4, zanr: 'triler'});

Osobe
CREATE (o1:Osoba {ime: 'Christopher Nolan', dob: 54});
CREATE (o2:Osoba {ime: 'Bong Joon-ho', dob: 55});
CREATE (o3:Osoba {ime: 'Francis Ford Coppola', dob: 85});
CREATE (o4:Osoba {ime: 'Leonardo DiCaprio', dob: 50});
CREATE (o5:Osoba {ime: 'Christian Bale', dob: 50});

Dodatne osobe
CREATE (o6:Osoba {ime: 'Tom Hardy', dob: 47});
CREATE (o7:Osoba {ime: 'Cillian Murphy', dob: 49});

Gradovi
CREATE (g1:Grad {naziv: 'Los Angeles'});
CREATE (g2:Grad {naziv: 'London'});
CREATE (g3:Grad {naziv: 'Seoul'});
CREATE (g4:Grad {naziv: 'Mostar'});

Provjera broja čvorova
MATCH (n)
RETURN count(n);


3. ZADATAK — KREIRANJE VEZA

REZIURAO
MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'Inception'})
CREATE (o)-[:REZIRAO]->(f);

MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'The Dark Knight'})
CREATE (o)-[:REZIRAO]->(f);

MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'Interstellar'})
CREATE (o)-[:REZIRAO]->(f);

MATCH (o:Osoba {ime: 'Christopher Nolan'}), (f:Film {naslov: 'Memento'})
CREATE (o)-[:REZIRAO]->(f);

MATCH (o:Osoba {ime: 'Bong Joon-ho'}), (f:Film {naslov: 'Parasite'})
CREATE (o)-[:REZIRAO]->(f);

MATCH (o:Osoba {ime: 'Francis Ford Coppola'}), (f:Film {naslov: 'The Godfather'})
CREATE (o)-[:REZIRAO]->(f);


GLUMIO_U
MATCH (o:Osoba {ime: 'Leonardo DiCaprio'}), (f:Film {naslov: 'Inception'})
CREATE (o)-[:GLUMIO_U]->(f);

MATCH (o:Osoba {ime: 'Christian Bale'}), (f:Film {naslov: 'The Dark Knight'})
CREATE (o)-[:GLUMIO_U]->(f);

MATCH (o:Osoba {ime: 'Tom Hardy'}), (f:Film {naslov: 'Inception'})
CREATE (o)-[:GLUMIO_U]->(f);

MATCH (o:Osoba {ime: 'Cillian Murphy'}), (f:Film {naslov: 'Interstellar'})
CREATE (o)-[:GLUMIO_U]->(f);


ZIVI_U
MATCH (o:Osoba {ime: 'Christopher Nolan'}), (g:Grad {naziv: 'London'})
CREATE (o)-[:ZIVI_U]->(g);

MATCH (o:Osoba {ime: 'Leonardo DiCaprio'}), (g:Grad {naziv: 'Los Angeles'})
CREATE (o)-[:ZIVI_U]->(g);

MATCH (o:Osoba {ime: 'Bong Joon-ho'}), (g:Grad {naziv: 'Seoul'})
CREATE (o)-[:ZIVI_U]->(g);


PRIJATELJ
MATCH (a:Osoba {ime: 'Christopher Nolan'}), (b:Osoba {ime: 'Christian Bale'})
CREATE (a)-[:PRIJATELJ {od: 2000}]->(b);

MATCH (a:Osoba {ime: 'Leonardo DiCaprio'}), (b:Osoba {ime: 'Christopher Nolan'})
CREATE (a)-[:PRIJATELJ {od: 2010}]->(b);

MATCH (a:Osoba {ime: 'Christopher Nolan'}), (b:Osoba {ime: 'Bong Joon-ho'})
CREATE (a)-[:PRIJATELJ]->(b);


Graf
MATCH (n)-[r]->(m)
RETURN n,r,m;



4. ZADATAK- MATCH UPITI

Trileri sortirani po godini
MATCH (f:Film)
WHERE f.zanr = 'triler'
RETURN f.naslov, f.godina
ORDER BY f.godina ASC;


Redatelj i grad
MATCH (o:Osoba)-[:ZIVI_U]->(g:Grad),
      (o)-[:REZIRAO]->(f:Film)
RETURN o.ime, g.naziv;


Filmovi između 2008 i 2015
MATCH (f:Film)
WHERE f.godina >= 2008 AND f.godina <= 2015
RETURN f.naslov, f.godina;


Redatelji s više od jednog filma
MATCH (o:Osoba)-[:REZIRAO]->(f:Film)
WITH o, count(f) AS broj
WHERE broj > 1
RETURN o.ime, broj;



5. ZADATAK— PUTOVI I TRAVERSAL

Najkraći put
MATCH p = shortestPath(
(a:Osoba {ime:'Leonardo DiCaprio'})-[*]-(b:Osoba {ime:'Bong Joon-ho'})
)
RETURN p;


Čvorovi udaljeni najviše 2 veze od Londona
MATCH (g:Grad {naziv:'London'})-[*1..2]-(n)
RETURN DISTINCT n;


Provjera povezanosti
MATCH (a:Osoba {ime:'Francis Ford Coppola'})
MATCH (b:Osoba {ime:'Leonardo DiCaprio'})
RETURN EXISTS(
 (a)-[*1..4]-(b)
) AS povezani;



ZADATAK 6 — AGREGACIJE

Broj filmova i prosječna ocjena
MATCH (f:Film)
RETURN count(f), avg(f.ocjena);


Broj filmova po žanru i maksimalna ocjena
MATCH (f:Film)
WITH f.zanr AS zanr, count(f) AS broj, max(f.ocjena) AS max_ocjena
RETURN zanr, broj, max_ocjena;


Grad s najviše osoba
MATCH (o:Osoba)-[:ZIVI_U]->(g:Grad)
WITH g, count(o) AS broj
ORDER BY broj DESC
LIMIT 1
MATCH (o:Osoba)-[:ZIVI_U]->(g)
RETURN g.naziv, collect(o.ime);


Lista glumaca po filmu
MATCH (o:Osoba)-[:GLUMIO_U]->(f:Film)
RETURN f.naslov, collect(o.ime);


7. ZADATAK— INDEKSI I CONSTRAINTI

Indeksi
CREATE INDEX film_ocjena FOR (f:Film) ON (f.ocjena);

CREATE INDEX osoba_ime FOR (o:Osoba) ON (o.ime);


Constraint
CREATE CONSTRAINT film_naslov_unique
FOR (f:Film)
REQUIRE f.naslov IS UNIQUE;


Prikaz indeksa
SHOW INDEXES;


Prikaz constrainta
SHOW CONSTRAINTS;