CREATE DATABASE verdansk_db;
USE verdansk_db;

-- Création de la table des régions avec image
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
-- La contrainte CHECK est supportée à partir de MySQL 8
CREATE TABLE rotations (
    rotation_id INT PRIMARY KEY AUTO_INCREMENT,
    from_region INT NOT NULL,
    to_region INT NOT NULL,
    difficulty TINYINT NOT NULL CHECK (difficulty BETWEEN 1 AND 5),
    FOREIGN KEY (from_region) REFERENCES regions(region_id),
    FOREIGN KEY (to_region) REFERENCES regions(region_id)
);

-- Insertion d'exemples de régions de Verdansk
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
  ('Promenade East', 'https://static1-es.millenium.gg/articles/0/35/76/0/@/166189-promenade-en-el-verdansk-original-full-1.jpg'),
  ('Promenade West', 'https://callofdutymaps.com/wp-content/uploads/warzonepromenadewest-740x416.jpg'),
  ('Hills', 'https://wallpapercave.com/wp/wp8326840.jpg'),
  ('Park', 'https://example.com/images/verdansk_garrison.jpg'),
  ('Farmland', 'https://callofdutymaps.com/wp-content/uploads/verdansk843-1536x864.jpg');

-- Insertion d'exemples d'armes de Warzone
INSERT INTO weapons (weapon_name, weapon_image, weapon_type) VALUES
  ('M4A1', 'https://images2.minutemediacdn.com/image/upload/c_fill,w_720,ar_16:9,f_auto,q_auto,g_auto/shape/cover/sport/dataimagejpegbase649j4RAERXhpZgAATU0AKgAAAAgADAEAA-8382e1b707a6c95d4f15a8671c73cdba.jpg', 'AR'),
  ('Kilo 141', 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2020/08/call-of-duty-kilo-141.jpg', 'AR'),
  ('Grau 5.56', 'https://komponentenpc.com/wp-content/uploads/2021/07/1626418727_Bestes-Grau-Loadout-fuer-Warzone-Season-4-Reloaded.JPG', 'AR'),
  ('MP5', 'https://images2.minutemediacdn.com/image/upload/c_fill,w_720,ar_16:9,f_auto,q_auto,g_auto/shape/cover/sport/dataimagepngbase64iVBORw0KGgoAAAANSUhEUgAAB4AAAAQ4-a3c99e219fc16fd011af63670a7657d8.jpg', 'smg'),
  ('MAC-10', 'https://example.com/images/mac10.jpg', 'smg'),
  ('HDR', 'https://www.pcgamesn.com/wp-content/sites/pcgamesn/2021/03/call-of-duty-warzone-best-hdr-warzone-setup-11.jpg', 'sniper'),
  ('AX-50', 'https://staticg.sportskeeda.com/editor/2022/05/5aff5-16535274158714-1920.jpg', 'sniper'),
  ('725', 'https://staticg.sportskeeda.com/editor/2020/10/cad6b-16020157370149-800.jpg', 'fusil tatic'),
  ('1911', 'https://cdn1.epicgames.com/ue/product/Featured/CC1911_featured-894x488-3c7490814537486ae2d3c3a7f2f0c52c.png', 'pistolet'),
  ('M19', 'https://cdna.artstation.com/p/assets/images/images/027/178/706/4k/benjamin-turner-m19-v3-01.jpg?1590796579', 'pistolet'),
  ('Couteau de combat', 'https://cdnb.artstation.com/p/assets/covers/images/033/643/093/large/akhil-james-jose-akhil-james-jose-cb8.jpg?1610175021', 'corps à corps'),
  ('BRUEN MK9', 'https://static1-es.millenium.gg/articles/0/24/69/0/@/114837-bruen-article_image_t-1.png', 'mitrailleuse'),
  ('KAR 98', 'https://th.bing.com/th/id/OIP.tv0yhCpTge3Hlix4q7xeeQHaEK?rs=1&pid=ImgDetMain', 'fusil tatic'),
  ('JOKR', 'https://th.bing.com/th/id/OIP.s_C1NU7EayPW5vh3wJ_lcwHaEK?rs=1&pid=ImgDetMain', 'explosive');

-- Insertion d'exemples de rotations entre régions
INSERT INTO rotations (from_region, to_region, difficulty) VALUES
  (1, 3, 3),
  (3, 2, 2),
  (2, 4, 4),
  (5, 6, 3),
  (7, 8, 5),
  (4, 9, 4),
  (9, 10, 2);