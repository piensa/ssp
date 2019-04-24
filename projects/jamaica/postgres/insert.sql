CREATE TABLE users (ID SERIAL PRIMARY KEY NOT NULL,
		NAME text,
		PASSWORD text,
		EMAIL text
	);

INSERT INTO users(name, password, email) VALUES 
	('Peter Parker', 'lloyd', 'lloyd@jcf.gov.jm'),
	('Matt Murdoch', 'devon', 'devon@jcf.gov.jm'),
	('Bruce Banner', 'winston', 'winston@jcf.gov.jm'),
	('Stephen Strange', 'junior', 'junior@jcf.gov.jm'),
	('Reed Richards', 'delroy', 'delroy@jcf.gov.jm'),
	('Bruce Wayne', 'leroy', 'leroy@piensa.co'),
	('Clark Kent', 'fitzroy', 'fitzroy@piensa.co'),
	('Barry Allen', 'teddy', 'teddy@piensa.co'),
	('Allan Scott', 'mark', 'mark@piensa.co');
