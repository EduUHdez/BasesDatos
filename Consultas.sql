use nba;
SELECT * FROM equipos;
SELECT Ciudad FROM equipos;
SELECT * FROM equipos WHERE Conferencia='East';
SELECT count(*) FROM equipos WHERE Conferencia='East';
SELECT * FROM jugadores;
SELECT Nombre FROM jugadores WHERE Peso>250;
SELECT Nombre FROM jugadores WHERE Procedencia IN('Spain''China');
SELECT * FROM jugadores WHERE nombre LIKE '%John%';
-- Despues del WHERE se puede usar and para añadir otra busqueda mas
 
SELECT peso/2,20 FROM jugadores WHERE peso BETWEEN 220 and 250;

-- Para seleccionar dos columnas las ponemos separadas con una ,

SELECT nombre, peso/2,20 FROM jugadores WHERE peso BETWEEN 220 and 250;

SELECT nombre, max(peso) FROM jugadores;

SELECT nombre FROM jugadores WHERE nombre_equipo='Timberwolves';

SELECT avg(peso) FROM jugadores WHERE nombre_equipo='Lakers';

SELECT jugadores.nombre FROM jugadores, equipos WHERE ciudad='Los Angeles';

SELECT j.nombre, e.nombre, e.ciudad FROM jugadores j,equipos e WHERE ciudad='Los Angeles' AND j.nombre_equipo=e.nombre;

-- jugadores conf west miden mas de 7 pies
SELECT j.nombre, e.nombre FROM jugadores j, equipos e WHERE altura>'7-0' and Conferencia='west' AND j.nombre_equipo=e.nombre;

SELECT j.nombre, e.nombre FROM jugadores j, equipos e WHERE altura>'7-0' and Conferencia='west' AND j.nombre_equipo=e.nombre ORDER BY Altura desc;

-- edit-Format-Beautify Query
SELECT 
    nombre
FROM
    jugadores
WHERE
    altura = (SELECT 
            MAX(altura)
        FROM
            jugadores);
-- +----------+
-- | nombre   |
-- +----------+
-- | Yao Ming |
-- +----------+

-- count(*) cuenta las filas 

SELECT Conferencia, COUNT(*) from equipos GROUP BY Conferencia;
-- +-------------+----------+
-- | Conferencia | COUNT(*) |
-- +-------------+----------+
-- | East        |       15 |
-- | West        |       15 |
-- +-------------+----------+


SELECT Division, COUNT(*) from equipos GROUP BY Division;
-- +-----------+----------+
-- | Division  | COUNT(*) |
-- +-----------+----------+
-- | Atlantic  |        5 |
-- | SouthEast |        5 |
-- | Central   |        5 |
-- | Pacific   |        5 |
-- | SouthWest |        5 |
-- | NorthWest |        5 |
-- +-----------+----------+

SELECT Conferencia, COUNT(*) from equipos WHERE nombre LIKE 't%' GROUP BY Conferencia;
+-------------+----------+
| Conferencia | COUNT(*) |
+-------------+----------+
| West        |        2 |
+-------------+----------+

SELECT Procedencia, avg(peso) FROM jugadores WHERE Procedencia IN ('Spain','France') GROUP BY Procedencia;
+-------------+-----------+
| Procedencia | avg(peso) |
+-------------+-----------+
| Spain       |  208.6000 |
| France      |  219.2500 |
+-------------+-----------+

select Nombre_equipo, avg(peso) from jugadores GROUP BY Nombre_equipo HAVING avg(peso)>230 ORDER BY avg(peso);
+---------------+-----------+
| Nombre_equipo | avg(peso) |
+---------------+-----------+
| Jazz          |  230.0714 |
| Knicks        |  235.4667 |
+---------------+-----------+

SELECT j.nombre, e.nombre FROM jugadores j, equipos e WHERE Conferencia='west' AND j.nombre_equipo=e.nombre;
+----------------------+---------------+
| nombre               | nombre        |
+----------------------+---------------+
| Elton brand          | Clippers      |
| Paul Davis           | Clippers      |
| Dan Dickau           | Clippers      |
| Nick Fazekas         | Clippers      |
| Chris Kaman          | Clippers      |
| Brevin Knight        | Clippers      |
| Shaun Livingston     | Clippers      |
| Corey Maggette       | Clippers      |
| Cuttino Mobley       | Clippers      |
| Smush Parker         | Clippers      |
| Josh Powell          | Clippers      |
| Quinton Ross         | Clippers      |
| Tim Thomas           | Clippers      |
| al thornton          | Clippers      |
| Marcus Williams      | Clippers      |
| Andre Brown          | Grizzlies     |
| Kwame Brown          | Grizzlies     |
| Brian Cardinal       | Grizzlies     |
| Jason Collins        | Grizzlies     |
| Mike Conley          | Grizzlies     |
| Javaris Crittenton   | Grizzlies     |
| Rudy Gay             | Grizzlies     |
| Casey Jacobsen       | Grizzlies     |
| Kyle Lowry           | Grizzlies     |
| Aaron Mckie          | Grizzlies     |
| Darko Milicic        | Grizzlies     |
| Mike Miller          | Grizzlies     |
| Juan Carlos Navarro  | Grizzlies     |
| Hakim Warrick        | Grizzlies     |
| Chris Andersen       | Hornets       |
| Hilton Armstrong     | Hornets       |
| Ryan Bowen           | Hornets       |
| Rasual Butler        | Hornets       |
| Tyson Chandler       | Hornets       |
| Melvin Ely           | Hornets       |
| Mike James           | Hornets       |
| Jannero Pargo        | Hornets       |
| Chris Paul           | Hornets       |
| Morris Peterson      | Hornets       |
| Peja Stojakovic      | Hornets       |
| Bonzi Wells          | Hornets       |
| David West           | Hornets       |
| Julian Wright        | Hornets       |
| Morris Almond        | Jazz          |
| Carlos Boozer        | Jazz          |
| Ronnie Brewer        | Jazz          |
| Jarron Collins       | Jazz          |
| Kyrylo Fesenko       | Jazz          |
| Matt Harpring        | Jazz          |
| Jason Hart           | Jazz          |
| Andrei Kirilenko     | Jazz          |
| Kyle Korver          | Jazz          |
| C.J. Miles           | Jazz          |
| Paul Millsap         | Jazz          |
| Mehmet Okur          | Jazz          |
| Ronnie Price         | Jazz          |
| Deron Williams       | Jazz          |
| Shareef Abdur-Rahim  | Kings         |
| Ron Artest           | Kings         |
| Quincy Douby         | Kings         |
| Francisco Garcia     | Kings         |
| Spencer Hawes        | Kings         |
| Anthony Johnson      | Kings         |
| Kevin Martin         | Kings         |
| Brad Miller          | Kings         |
| Mikki More           | Kings         |
| mike john salmons    | Kings         |
| Keny Thomas          | Kings         |
| Beno Udrih           | Kings         |
| Shelden Williams     | Kings         |
| Lorenzen Wright      | Kings         |
| Brian Scalabrine     | Kings         |
| Trevor Ariza         | Lakers        |
| Kobe Bryant          | Lakers        |
| Andrew Bynum         | Lakers        |
| Jordan Farmar        | Lakers        |
| Derek Fisher         | Lakers        |
| Pau Gasol            | Lakers        |
| Didier Ilunga-Mbenga | Lakers        |
| Coby Karl            | Lakers        |
| Chris Mihm           | Lakers        |
| Ira Newble           | Lakers        |
| Lamar Odom           | Lakers        |
| Vladimir Radmanovic  | Lakers        |
| Ronny Turiaf         | Lakers        |
| Sasha Vujacic        | Lakers        |
| Luke Walton          | Lakers        |
| Malik Allen          | Mavericks     |
| Jose Barea           | Mavericks     |
| Brandon Bass         | Mavericks     |
| Erick Dampier        | Mavericks     |
| Josh Howard          | Mavericks     |
| Juwan Howard         | Mavericks     |
| Eddie Jones          | Mavericks     |
| Jason Kidd           | Mavericks     |
| Tyronn Lue           | Mavericks     |
| Jamaal Magloire      | Mavericks     |
| Dirk Nowitzki        | Mavericks     |
| Jerry Stackhouse     | Mavericks     |
| Jason Terry          | Mavericks     |
| Antoine Wright       | Mavericks     |
| Devean George        | Mavericks     |
| Carmelo Anthony      | Nuggets       |
| Chucky Atkins        | Nuggets       |
| Marcus Camby         | Nuggets       |
| Anthony Carter       | Nuggets       |
| Yakhouba Diawarra    | Nuggets       |
| Taurean Green        | Nuggets       |
| Steven Hunter        | Nuggets       |
| Allen Iverson        | Nuggets       |
| Linas Kleiza         | Nuggets       |
| Kenyon Martin        | Nuggets       |
| Eduardo Najera       | Nuggets       |
| Nene                 | Nuggets       |
| JR Smith             | Nuggets       |
| Rafer ALston         | Rockets       |
| Shane Battier        | Rockets       |
| Aaron Brooks         | Rockets       |
| Steve Francis        | Rockets       |
| Mike Harris          | Rockets       |
| Chuck Hayes          | Rockets       |
| Luther Head          | Rockets       |
| Bobby Jackson        | Rockets       |
| Carl Landry          | Rockets       |
| Tracy McGrady        | Rockets       |
| Dikembre Mutombo     | Rockets       |
| Steve NOvak          | Rockets       |
| Luis Scola           | Rockets       |
| Loren Woods          | Rockets       |
| Yao Ming             | Rockets       |
| Brent Barry          | Spurs         |
| Matt Bonner          | Spurs         |
| Bruce Bowen          | Spurs         |
| Tim Duncan           | Spurs         |
| Michael Finley       | Spurs         |
| Manu Ginobili        | Spurs         |
| Robert Horry         | Spurs         |
| Bobby Jones          | Spurs         |
| Ian Mahinmi          | Spurs         |
| Fabricio Oberto      | Spurs         |
| Tony Parker          | Spurs         |
| Damon Stoudamire     | Spurs         |
| Kurt Thomas          | Spurs         |
| Ime Udoka            | Spurs         |
| Jacque Vaughn        | Spurs         |
| Leandro Barbosa      | Suns          |
| Raja Bell            | Suns          |
| Boris Diaw           | Suns          |
| Gordan Giricek       | Suns          |
| Grant Hill           | Suns          |
| Sean Marks           | Suns          |
| Steve Nash - C       | Suns          |
| Shaquille ONeal      | Suns          |
| Eric Piatkowski      | Suns          |
| Brian Skinner        | Suns          |
| Amare Stoudemire     | Suns          |
| D.J. Strawberry      | Suns          |
| Alando Tucker        | Suns          |
| Nick Collison        | Supersonics   |
| Ronald Dupree        | Supersonics   |
| Kevin Durant         | Supersonics   |
| Francisco Elson      | Supersonics   |
| Mickael Gelabale     | Supersonics   |
| Jeff Green           | Supersonics   |
| Adrian Griffin       | Supersonics   |
| Donyell Marshall     | Supersonics   |
| Johan Petro          | Supersonics   |
| Luke Ridnour         | Supersonics   |
| Mouhamed Sene        | Supersonics   |
| Robert Swift         | Supersonics   |
| Earl Watson          | Supersonics   |
| Chris Wilcox         | Supersonics   |
| Damien Wilkins       | Supersonics   |
| Corey Brever         | Timberwolves  |
| Greg Buckner         | Timberwolves  |
| Michael Doleac       | Timberwolves  |
| Randy Foye           | Timberwolves  |
| Ryan Gomes           | Timberwolves  |
| Marko Jaric          | Timberwolves  |
| Al Jefferson         | Timberwolves  |
| Mark Madsen          | Timberwolves  |
| Rashard McCants      | Timberwolves  |
| Chris Richard        | Timberwolves  |
| Craig Smith          | Timberwolves  |
| Kirk Snyder          | Timberwolves  |
| Sebastian Telfair    | Timberwolves  |
| Antoine Walker       | Timberwolves  |
| LaMarcus Aldridge    | Trail Blazers |
| Steve Blake          | Trail Blazers |
| Channing Frye        | Trail Blazers |
| Jarrett Jack         | Trail Blazers |
| James Jones          | Trail Blazers |
| Raef LaFremtz        | Trail Blazers |
| Josh McRoberts       | Trail Blazers |
| Darius Miles         | Trail Blazers |
| Greg Oden            | Trail Blazers |
| Travis Outlaw        | Trail Blazers |
| Joel Przybilla       | Trail Blazers |
| Sergio Rodriguez     | Trail Blazers |
| Brandon Roy          | Trail Blazers |
| Von Wafer            | Trail Blazers |
| Martell Webster      | Trail Blazers |
| Kelenna Azubuike     | Warriors      |
| Matt Barnes          | Warriors      |
| Marco Belinelli      | Warriors      |
| Andris Biedrns       | Warriors      |
| Austin Croshere      | Warriors      |
| Baron Davis          | Warriors      |
| Monta Ellis          | Warriors      |
| Al Harrington        | Warriors      |
| Stephen Jackson      | Warriors      |
| Patrick O'Bryant     | Warriors      |
| Kosta Perovic        | Warriors      |
| Mickael Pietrus      | Warriors      |
| C.J. Watson          | Warriors      |
| Brandan Wright       | Warriors      |
+----------------------+---------------+
216 rows in set (0,00 sec)

mysql> SELECT nombre FROM jugadores WHERE Nombre_equipo IN(SELECT nombre FROM equipos WHERE Conferencia='West');
+----------------------+
| nombre               |
+----------------------+
| Elton brand          |
| Paul Davis           |
| Dan Dickau           |
| Nick Fazekas         |
| Chris Kaman          |
| Brevin Knight        |
| Shaun Livingston     |
| Corey Maggette       |
| Cuttino Mobley       |
| Smush Parker         |
| Josh Powell          |
| Quinton Ross         |
| Tim Thomas           |
| al thornton          |
| Marcus Williams      |
| Andre Brown          |
| Kwame Brown          |
| Brian Cardinal       |
| Jason Collins        |
| Mike Conley          |
| Javaris Crittenton   |
| Rudy Gay             |
| Casey Jacobsen       |
| Kyle Lowry           |
| Aaron Mckie          |
| Darko Milicic        |
| Mike Miller          |
| Juan Carlos Navarro  |
| Hakim Warrick        |
| Chris Andersen       |
| Hilton Armstrong     |
| Ryan Bowen           |
| Rasual Butler        |
| Tyson Chandler       |
| Melvin Ely           |
| Mike James           |
| Jannero Pargo        |
| Chris Paul           |
| Morris Peterson      |
| Peja Stojakovic      |
| Bonzi Wells          |
| David West           |
| Julian Wright        |
| Morris Almond        |
| Carlos Boozer        |
| Ronnie Brewer        |
| Jarron Collins       |
| Kyrylo Fesenko       |
| Matt Harpring        |
| Jason Hart           |
| Andrei Kirilenko     |
| Kyle Korver          |
| C.J. Miles           |
| Paul Millsap         |
| Mehmet Okur          |
| Ronnie Price         |
| Deron Williams       |
| Shareef Abdur-Rahim  |
| Ron Artest           |
| Quincy Douby         |
| Francisco Garcia     |
| Spencer Hawes        |
| Anthony Johnson      |
| Kevin Martin         |
| Brad Miller          |
| Mikki More           |
| mike john salmons    |
| Keny Thomas          |
| Beno Udrih           |
| Shelden Williams     |
| Lorenzen Wright      |
| Brian Scalabrine     |
| Trevor Ariza         |
| Kobe Bryant          |
| Andrew Bynum         |
| Jordan Farmar        |
| Derek Fisher         |
| Pau Gasol            |
| Didier Ilunga-Mbenga |
| Coby Karl            |
| Chris Mihm           |
| Ira Newble           |
| Lamar Odom           |
| Vladimir Radmanovic  |
| Ronny Turiaf         |
| Sasha Vujacic        |
| Luke Walton          |
| Malik Allen          |
| Jose Barea           |
| Brandon Bass         |
| Erick Dampier        |
| Josh Howard          |
| Juwan Howard         |
| Eddie Jones          |
| Jason Kidd           |
| Tyronn Lue           |
| Jamaal Magloire      |
| Dirk Nowitzki        |
| Jerry Stackhouse     |
| Jason Terry          |
| Antoine Wright       |
| Devean George        |
| Carmelo Anthony      |
| Chucky Atkins        |
| Marcus Camby         |
| Anthony Carter       |
| Yakhouba Diawarra    |
| Taurean Green        |
| Steven Hunter        |
| Allen Iverson        |
| Linas Kleiza         |
| Kenyon Martin        |
| Eduardo Najera       |
| Nene                 |
| JR Smith             |
| Rafer ALston         |
| Shane Battier        |
| Aaron Brooks         |
| Steve Francis        |
| Mike Harris          |
| Chuck Hayes          |
| Luther Head          |
| Bobby Jackson        |
| Carl Landry          |
| Tracy McGrady        |
| Dikembre Mutombo     |
| Steve NOvak          |
| Luis Scola           |
| Loren Woods          |
| Yao Ming             |
| Brent Barry          |
| Matt Bonner          |
| Bruce Bowen          |
| Tim Duncan           |
| Michael Finley       |
| Manu Ginobili        |
| Robert Horry         |
| Bobby Jones          |
| Ian Mahinmi          |
| Fabricio Oberto      |
| Tony Parker          |
| Damon Stoudamire     |
| Kurt Thomas          |
| Ime Udoka            |
| Jacque Vaughn        |
| Leandro Barbosa      |
| Raja Bell            |
| Boris Diaw           |
| Gordan Giricek       |
| Grant Hill           |
| Sean Marks           |
| Steve Nash - C       |
| Shaquille ONeal      |
| Eric Piatkowski      |
| Brian Skinner        |
| Amare Stoudemire     |
| D.J. Strawberry      |
| Alando Tucker        |
| Nick Collison        |
| Ronald Dupree        |
| Kevin Durant         |
| Francisco Elson      |
| Mickael Gelabale     |
| Jeff Green           |
| Adrian Griffin       |
| Donyell Marshall     |
| Johan Petro          |
| Luke Ridnour         |
| Mouhamed Sene        |
| Robert Swift         |
| Earl Watson          |
| Chris Wilcox         |
| Damien Wilkins       |
| Corey Brever         |
| Greg Buckner         |
| Michael Doleac       |
| Randy Foye           |
| Ryan Gomes           |
| Marko Jaric          |
| Al Jefferson         |
| Mark Madsen          |
| Rashard McCants      |
| Chris Richard        |
| Craig Smith          |
| Kirk Snyder          |
| Sebastian Telfair    |
| Antoine Walker       |
| LaMarcus Aldridge    |
| Steve Blake          |
| Channing Frye        |
| Jarrett Jack         |
| James Jones          |
| Raef LaFremtz        |
| Josh McRoberts       |
| Darius Miles         |
| Greg Oden            |
| Travis Outlaw        |
| Joel Przybilla       |
| Sergio Rodriguez     |
| Brandon Roy          |
| Von Wafer            |
| Martell Webster      |
| Kelenna Azubuike     |
| Matt Barnes          |
| Marco Belinelli      |
| Andris Biedrns       |
| Austin Croshere      |
| Baron Davis          |
| Monta Ellis          |
| Al Harrington        |
| Stephen Jackson      |
| Patrick O'Bryant     |
| Kosta Perovic        |
| Mickael Pietrus      |
| C.J. Watson          |
| Brandan Wright       |
+----------------------+
216 rows in set (0,00 sec)



