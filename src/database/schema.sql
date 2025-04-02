-- Création de la base de données (optionnel selon votre SGBD)
CREATE DATABASE IF NOT EXISTS verdansk_db;
USE verdansk_db;

-- Création de la table des régions avec image représentative
CREATE TABLE regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(100) NOT NULL,
    region_image VARCHAR(255)  -- URL ou chemin de l'image
);

-- Création de la table des armes avec image et type d'arme
CREATE TABLE weapons (
    weapon_id INT PRIMARY KEY AUTO_INCREMENT,
    weapon_name VARCHAR(100) NOT NULL,
    weapon_image VARCHAR(255),  -- URL ou chemin de l'image de l'arme
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

-- Insertion des données réelles pour les régions de Verdansk
INSERT INTO regions (region_name, region_image) VALUES
  ('Airport', 'https://static2.gamerantimages.com/wordpress/wp-content/uploads/2020/12/call-of-duty-warzone-verdansk-airport.jpg'), 
  ('Stadium', 'https://www.ginx.tv/uploads/verdansk_stadium.jpg'), 
  ('Downtown', 'https://imgix.bustle.com/uploads/image/2021/9/29/5bb5ba8e-c877-418c-8159-62896ab4e70f-06e-verdansk-centralandsouth-tout-4d.jpg?w=1200&h=630&fit=crop&crop=faces&fm=jpg'),
  ('Quarry', 'https://static1-es.millenium.gg/articles/0/35/76/0/@/166181-quarry-en-el-verdansk-original-full-1.jpg'), 
  ('Harbor', 'https://callofdutymaps.com/wp-content/uploads/portofverdansk1-1536x864.jpg'),
  ('Hospital', 'https://radar1.pythonanywhere.com/media/images/verdansk.jpg'),
  ('TV Station', 'https://callofdutymaps.com/wp-content/uploads/warzonetvstation-1536x864.jpg'),
  ('Dam', 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2021/02/call-of-duty-gora-dam.jpg'),
  ('Storage town', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Lumber', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Military Base', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Train Station', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Boneyard', 'https://example.com/images/verdansk_garrison.jpg'),
  ('SuperStore', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Prison', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Storage town', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Promenade East', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Promenade West', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Hills', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Park', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Farmland', 'https://example.com/images/verdansk_farm.jpg');

-- Insertion des données pour les armes de Warzone 1
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
  ('Combat Knife', 'https://example.com/images/knife.jpg', 'corps à corps'),
  ('PKM', 'https://example.com/images/pkm.jpg', 'mitrailleuse'),
  ('JOKR', 'https://example.com/images/jokr.jpg', 'explosive');

-- Insertion d'exemples de rotations entre régions
-- (Les region_id font référence à l'ordre d'insertion ci-dessus : 1 = Airport, 2 = Stadium, 3 = Downtown, etc.)
INSERT INTO rotations (from_region, to_region, difficulty) VALUES
  (1, 3, 3),  -- De l'Aéroport vers le Centre-ville
  (3, 2, 2),  -- Du Centre-ville vers le Stade
  (2, 4, 4),  -- Du Stade vers la Carrière
  (5, 6, 3),  -- Du Port vers l'Hôpital
  (7, 8, 5),  -- De la Station TV vers le Barrage (rotation particulièrement difficile)
  (4, 9, 4),  -- De la Carrière vers la Garnison
  (9, 10, 2); -- De la Garnison vers la Ferme
