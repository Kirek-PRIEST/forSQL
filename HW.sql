-- Задача 1
drop FUNCTION seconds_to_time; 

DELIMITER $$
CREATE FUNCTION seconds_to_time(x INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE timed VARCHAR(100);
SET timed = CONCAT(FLOOR(x/60/60/24), ' days ', FLOOR(x/60/60%24), ' hours ', FLOOR(x/60%60), ' minutes ', FLOOR(x%60), ' seconds ');
RETURN timed;
END $$
DELIMITER ;

SELECT seconds_to_time(123456);

-- Задача 2
DROP PROCEDURE even;
DELIMITER $$
CREATE PROCEDURE even(x INT)
BEGIN
DECLARE count INT DEFAULT 1;
DECLARE res VARCHAR(200) default '';
WHILE count <= x DO
	IF count%2 = 0 THEN
			SET res = CONCAT(res, ' ', count);
            SET count = count + 1;
    ELSE SET count = count + 1;
    END IF;
END WHILE;
SELECT res;
END$$
DELIMITER ;

CALL even(50)