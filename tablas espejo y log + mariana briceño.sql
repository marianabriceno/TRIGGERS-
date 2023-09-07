-- creacion de tablas espejo  -- 

CREATE TABLE espejo_albumes (
    id_artist INT,
    album_name VARCHAR(30) PRIMARY KEY,
    nombre_art VARCHAR(40),
    año_public INT,
    duracion_total_album INT,
    FOREIGN KEY (id_artist) REFERENCES artist (id_artist)
);

CREATE TABLE espejo_play_list (
   
   cant_de_me_gusta VARCHAR(30)
    
    );
    
    -- creacion de log -- 

CREATE TABLE logs(
    fecha_hora TIMESTAMP,
    usuario VARCHAR(50)
);
    
