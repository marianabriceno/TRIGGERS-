-- insersion de datos con trigger AFTER --

CREATE TRIGGER `NEW_ARTISTA_Y_ALBUM_RECIENTE`
AFTER INSERT ON `albumes`
FOR EACH ROW
		INSERT INTO espejo_albumes( id_artist,album_name,nombre_art,año_public,duracion_total_album)
		VALUES (NEW.id_artist,NEW.album_name,NEW.nombre_art,NEW.año_public,NEW.duracion_total_album);

SELECT * FROM espejo_albumes;

-- prueba del trigger -- NEW_ARTISTA_Y_ALBUM_RECIENTE

INSERT INTO artist  VALUES (37,'queen ifrica');
---------

INSERT INTO albumes
VALUES ( 37,'climb','queen ifrica',2017,1);

-- se hace primer un inset de datos en la tabla artista porque da error si tiramos el insert en albumes de una vez, esto sucede porque hay primary key y foreign involucradas--
INSERT INTO artist
VALUES(38,'red hot chilli peppers');

INSERT INTO albumes
VALUES ( 38,'Return of the Dream Canteen','red hot chilli peppers',20227,1);

SELECT * FROM espejo_albumes;

    
    -- creacion de trigger con BEFORE Y UPDATE --
    
CREATE TRIGGER `BEFORE_ACTUALIZACION_DE_ME_GUSTA`
BEFORE UPDATE ON `play_list`
FOR EACH ROW
	INSERT INTO espejo_play_list(cant_de_me_gusta)
	VALUES (NEW.cant_de_me_gusta);
    
UPDATE play_list
	SET cant_de_me_gusta = '5992'
	WHERE id_artist = 17;

SELECT * FROM espejo_play_list;

-- se creo , para usuario que realizó la operación, la fecha, y la hora -- 

CREATE TRIGGER after_delete_play_list
AFTER DELETE ON play_list
FOR EACH ROW
	INSERT INTO logs (fecha_hora, usuario)
    VALUES (CURRENT_TIMESTAMP(), USER());
    
        CREATE TRIGGER after_delete_genero
AFTER DELETE ON genero
FOR EACH ROW
	INSERT INTO logs (fecha_hora, usuario)
    VALUES (CURRENT_TIMESTAMP(), USER());
    
    -- se hizo la eliminacion de la tabla play list el dato de playlist ya que no me deja eliminar id's porque estan en tablas padre -- 
    
    DELETE FROM play_list
    WHERE play_list = 'arjona clasicos';
    
     DELETE FROM play_list
    WHERE play_list = 'el dojo';
    
    DELETE FROM genero
    WHERE id_artist = '5';
    
    DELETE FROM genero
    WHERE id_artist = 35;
    
    SELECT *FROM logs;