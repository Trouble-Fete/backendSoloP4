-- Création de la base de données
CREATE DATABASE IF NOT EXISTS verdansk_db;
USE verdansk_db;

-- Création de la table des régions avec image des regions
CREATE TABLE regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(100) NOT NULL,
    region_image VARCHAR(255)
);

-- Création de la table des armes avec image et type d'arme
CREATE TABLE weapons (
    weapon_id INT PRIMARY KEY AUTO_INCREMENT,
    weapon_name VARCHAR(100) NOT NULL,
    weapon_image VARCHAR(255),
    weapon_type ENUM('sniper', 'AR', 'smg', 'fusil tatic', 'pistolet', 'corps à corps', 'mitrailleuse', 'explosive') NOT NULL
);

-- Création de la table des rotations entre régions avec difficulté (1 à 5)
CREATE TABLE rotations (
    rotation_id INT PRIMARY KEY AUTO_INCREMENT,
    from_region INT NOT NULL,
    to_region INT NOT NULL,
    difficulty TINYINT NOT NULL CHECK (difficulty BETWEEN 1 AND 5),
    FOREIGN KEY (from_region) REFERENCES regions(region_id),
    FOREIGN KEY (to_region) REFERENCES regions(region_id)
);

-- régions de Verdansk
INSERT INTO regions (region_name, region_image) VALUES
  ('Airport', 'https://static2.gamerantimages.com/wordpress/wp-content/uploads/2020/12/call-of-duty-warzone-verdansk-airport.jpg'), 
  ('Stadium', 'https://www.ginx.tv/uploads/verdansk_stadium.jpg'), 
  ('Downtown', 'https://imgix.bustle.com/uploads/image/2021/9/29/5bb5ba8e-c877-418c-8159-62896ab4e70f-06e-verdansk-centralandsouth-tout-4d.jpg?w=1200&h=630&fit=crop&crop=faces&fm=jpg'),
  ('Quarry', 'https://static1-es.millenium.gg/articles/0/35/76/0/@/166181-quarry-en-el-verdansk-original-full-1.jpg'), 
  ('Harbor', 'https://callofdutymaps.com/wp-content/uploads/portofverdansk1-1536x864.jpg'),
  ('Hospital', 'https://radar1.pythonanywhere.com/media/images/verdansk.jpg'),
  ('TV Station', 'https://callofdutymaps.com/wp-content/uploads/warzonetvstation-1536x864.jpg'),
  ('Dam', 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2021/02/call-of-duty-gora-dam.jpg'),
  ('Storage town', 'https://callofdutymaps.com/wp-content/uploads/verdansk848-1536x864.jpg'),
  ('Lumber', 'https://lh5.googleusercontent.com/nNsisLgVQr4cpHFUgD_ZDepPlLjJnSovI4kBS1xOC34V34A627lsa3PSTt68r5k5gJZLDDcqDtMiBDAIWzFyXHBkV0YAlgjN7n4DB9gdPS4agIlA1EDL5hC5Gfzdo4TYu1BjkOCS'),
  ('Military Base', 'https://lh3.googleusercontent.com/OO43bJhGH4F5Mh5ssuvaG05OTW1gy3KxhblilNpQRYbrJ-RNGG4dsgyDjJCSQGdAD6AZW8n8xK3cjwm8mVhI9-dmWDt7-WcLnFHtEUWOrFOSu4gDEDqkz6OeSqvh1pOClvvWlDSL'),
  ('Train Station', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Boneyard', 'https://callofdutymaps.com/wp-content/uploads/boneyard8-768x432.jpg'),
  ('SuperStore', 'https://chumley.barstoolsports.com/union/2022/08/14/EmFMB0hWoAI9aVs.196a0a0e.jpeg?canvas=4:3&bg-color=000000'),
  ('Prison', 'https://www.dexerto.fr/cdn-cgi/image/width=3840,quality=75,format=auto/https://editors.dexerto.fr/wp-content/uploads/sites/2/2023/12/09/retour-verdansk-warzone-semble-se-preciser.jpg'),
  ('Promenade East', 'https://th.bing.com/th/id/R.4d752a24abd6f07b262c1f7e545424f0?rik=UxBYoRHxvuhzEw&riu=http%3a%2f%2foyster.ignimgs.com%2fwordpress%2fstg.ign.com%2f2021%2f03%2fZONE3D-031B-Apartments-Block-North.jpg&ehk=CfnytT8NaWsCD2USeqtPFbEO653dkOt%2fo%2fh7Q%2ffFr48%3d&risl=&pid=ImgRaw&r=0'),
  ('Promenade West', 'https://callofdutymaps.com/wp-content/uploads/warzonepromenadewest-740x416.jpg'),
  ('Hills', 'https://wallpapercave.com/wp/wp8326840.jpg'),
  ('Park', 'https://example.com/images/verdansk_garrison.jpg'), --pas trouvée encore.....
  ('Farmland', 'https://callofdutymaps.com/wp-content/uploads/verdansk843-1536x864.jpg');

-- armes de Warzone
INSERT INTO weapons (weapon_name, weapon_image, weapon_type) VALUES
  ('M4A1', 'https://example.com/images/m4a1.jpg', 'AR'),
  ('Kilo 141', 'https://example.com/images/kilo141.jpg', 'AR'),
  ('Grau 5.56', 'https://example.com/images/grau556.jpg', 'AR'),
  ('MP5', 'https://example.com/images/mp5.jpg', 'smg'),
  ('MAC-10', 'https://example.com/images/mac10.jpg', 'smg'),
  ('HDR', 'https://example.com/images/hdr.jpg', 'sniper'),
  ('AX-50', 'https://example.com/images/ax50.jpg', 'sniper'),
  ('725', 'https://example.com/images/725.jpg', 'fusil tatic'),
  ('1911', 'https://example.com/images/1911.jpg', 'pistolet'),
  ('M19', 'https://example.com/images/m19.jpg', 'pistolet'),
  ('Couteau de combat', 'https://example.com/images/knife.jpg', 'corps à corps'),
  ('PKM', 'https://example.com/images/pkm.jpg', 'mitrailleuse'),
  ('kAR 98', 'https://example.com/images/pkm.jpg', 'fusil tactique'),
  ('JOKR', 'https://example.com/images/jokr.jpg', 'explosive');

-- exemples de rotations entre régions
-- (Les region_id font référence à l'ordre d'insertion ci-dessus : 1 = Airport, 2 = Stadium, 3 = Downtown, etc.)
INSERT INTO rotations (from_region, to_region, difficulty) VALUES
  (1, 3, 3),  -- De l'Aéroport vers le Centre-ville
  (3, 2, 2),  -- Du Centre-ville vers le Stade
  (2, 4, 4),  -- Du Stade vers la Carrière
  (5, 6, 3),  -- Du Port vers l'Hôpital
  (7, 8, 5),  -- De la Station TV vers le Barrage (rotation très difficile)
  (4, 9, 4),  -- De la Carrière vers la storage
  (9, 10, 2); -- De la Garnison vers la Ferme


--possibilité d'ajouter, de mettre à jour et supprimer les rotations entre les zones par l'admin et les joueurs