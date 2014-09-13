use [mcbean.clinic]


select * from diagnosticcode where [group] <1 

update diagnosticcode set [group] = 1
where code >= '001' and code <= '140' and version = 9

update diagnosticcode set [group] = 2
where code >= '140' and code <= '23999' and version = 9

update diagnosticcode set [group] = 3
where code >= '240' and code <= '27999' and version = 9

update diagnosticcode set [group] = 4
where code >= '280' and code <= '28999' and version = 9

update diagnosticcode set [group] = 5
where code >= '290' and code <= '319' and version = 9

update diagnosticcode set [group] = 6
where code >= '320' and code <= '38999' and version = 9

update diagnosticcode set [group] = 7
where code >= '390' and code <= '45999' and version = 9

update diagnosticcode set [group] = 8
where code >= '460' and code <= '51999' and version = 9

update diagnosticcode set [group] = 9
where code >= '520' and code <= '57999' and version = 9

update diagnosticcode set [group] = 10
where code >= '580' and code <= '62999' and version = 9

update diagnosticcode set [group] = 11
where code >= '630' and code <= '67999' and version = 9

update diagnosticcode set [group] = 12
where code >= '680' and code <= '70999' and version = 9

update diagnosticcode set [group] = 13
where code >= '710' and code <= '73999' and version = 9

update diagnosticcode set [group] = 14
where code >= '740' and code <= '75999' and version = 9

update diagnosticcode set [group] = 15
where code >= '760' and code <= '77999' and version = 9

update diagnosticcode set [group] = 16
where code >= '780' and code <= '79999' and version = 9

update diagnosticcode set [group] = 17
where code >= '800' and code <= '99999' and version = 9

update diagnosticcode set [group] = 18
where code like 'V%' 

update diagnosticcode set [group] = 19
where code like 'E%' 


--delete from diagnosticcodegroup

INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 1, 'Infectious And Parasitic Diseases'); 
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 2, 'Neoplasms'); 
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 3, 'Endocrine, Nutritional And Metabolic Diseases And Immunity Disorders');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 4, 'Diseases Of Blood And Blood-Forming Organs');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 5, 'Mental Disorders');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 6, 'Diseases Of The Nervous System And Sense Organs');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 7, 'Diseases Of The Circulatory System');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 8, 'Diseases Of The Respiratory System');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 9, 'Diseases Of The Digestive System');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 10, 'Diseases Of The Genitourinary System');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 11, 'Complications Of Pregnancy, Childbirth And The Puerperium');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 12, 'Diseases Of The Skin And Subcutaneous Tissue');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 13, 'Diseases Of The Musculosketal System And Connective Tissue');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 14, 'Congenital Anomalies');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 15, 'Certain Conditions Originating In The Perinatal Period');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 16, 'Symptoms, Signs And Ill-Defined Conditions');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 17, 'Injury And Poisoning');  
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 18, 'V Codes'); 
INSERT INTO DiagnosticCodeGroup (Version,[Level],Sequence,[Description]) VALUES(9,1, 19, 'E Codes'); 

select * from diagnosticcodegroup


select code,d.[description]from diagnosticcode d
inner join diagnosticcodegroup g
on d.[group] = g.sequence
where g.[description]  like 'injury%'


select * from diagnosticcode
where code >= '279' and code <= '999'

delete from diagnosticcodegroup where level = 2

select * from diagnosticcode 
where [group] = 4 and subgroup = 3