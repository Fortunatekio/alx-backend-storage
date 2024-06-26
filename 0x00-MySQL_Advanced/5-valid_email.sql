-- a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.
DELIMITER $$

DROP TRIGGER IF EXISTS validate_mail;
CREATE TRIGGER validate_mail
            BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET  NEW.valid_email = 0;
    END IF;
END; $$
