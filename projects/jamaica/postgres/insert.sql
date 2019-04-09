CREATE TABLE users (ID SERIAL PRIMARY KEY NOT NULL,
		NAME text,
		PASSWORD text,
		EMAIL text
	);

INSERT INTO users(name, password, email) VALUES 
	('Peter Parker', 'lloyd', 'lloyd@jcf.com'),
	('Matt Murdoch', 'devon', 'devon@jcf.com'),
	('Bruce Banner', 'winston', 'winston@jcf.com'),
	('Stephen Strange', 'junior', 'junior@jcf.com'),
	('Reed Richards', 'delroy', 'delroy@jcf.com'),
	('Bruce Wayne', 'leroy', 'leroy@outlook.com'),
	('Clark Kent', 'fitzroy', 'fitzroy@outlook.com'),
	('Barry Allen', 'teddy', 'teddy@outlook.com'),
	('Allan Scott', 'mark', 'mark@outlook.com');