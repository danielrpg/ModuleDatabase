print 'insert data into the contracts table';
if(select count(*) from dbo.contracts)=0
begin
	set identity_insert dbo.contracts on;
	INSERT INTO dbo.contracts (contract_id, created_on, updated_on, contract_city, contract_code, contract_date, contract_description, contract_salary, contract_type) VALUES (1, '2018-05-27 23:56:44', null, 'Cbba', '001', '2018-05-27 23:56:44', 'Contrato de pasantia universitaria', 1000, 'Semestral');
	INSERT INTO dbo.contracts (contract_id, created_on, updated_on, contract_city, contract_code, contract_date, contract_description, contract_salary, contract_type) VALUES (2, '2018-05-27 23:56:44', null, 'cbba', '002', '2018-05-27 23:56:44', 'contrato para evalucion de personal externo', 3500.5, 'Indefinido');
	set identity_insert dbo.contracts off;
	print 'contracts done';
end
