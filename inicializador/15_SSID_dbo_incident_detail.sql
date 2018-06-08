print 'insert data into the incident_detail table';
if(select count(*) from dbo.incident_detail)=0
begin
	set identity_insert dbo.incident_detail on;
	INSERT INTO dbo.incident_detail (incident_detail_id, incident_detail_status, incident_detail_name, incident_detail_description) VALUES (1, 'entregado', '', 'En fecha 02 de Mayo el Ingeniero se accidente');
	INSERT INTO dbo.incident_detail (incident_detail_id, incident_detail_status, incident_detail_name, incident_detail_description) VALUES (2, 'pendiente', '', 'En fecha 02 de Mayo el cortador Gonzales tenia gripe');
	INSERT INTO dbo.incident_detail (incident_detail_id, incident_detail_status, incident_detail_name, incident_detail_description) VALUES (3, 'reportado', '', 'En fecha 24 de Abril el Licenciado Maldonado reporto que el piso del sector 7 estaba mojado');
	set identity_insert dbo.incident_detail off;
	print 'incident_detail done';
end
