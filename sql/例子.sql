SELECT HEX(AES_ENCRYPT("HelloWorld","new retail"));

SELECT AES_DECRYPT(UNHEX("799531CA0BEB4078163F10BD4D081DDC"), "new retail");

INSERT INTO t_costomer(username, `password`, wechat,tel)
VALUES(
	"jack123",
	HEX(AES_ENCRYPT("abc123456","jack12")),
	"jack123",
	"15912345678"
);