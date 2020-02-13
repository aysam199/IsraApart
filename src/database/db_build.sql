BEGIN;

DROP TABLE IF EXISTS city,
hostel,
apartment,
reservation,
guest;


create table city (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);
insert into city (name) values ('Haifa');
insert into city (name) values ('Nazareth');
insert into city (name) values ('Akko');
insert into city (name) values ('Tel_aviv');
insert into city (name) values ('Majdal_shams');
insert into city (name) values ('Um_el_fahim');
insert into city (name) values ('Herzliya');
insert into city (name) values ('Ceserea');
insert into city (name) values ('Kfar_saba');
insert into city (name) values ('Jerusalem');
insert into city (name) values ('Eilat');
insert into city (name) values ('Beersheba');
insert into city (name) values ('Ramat-Gan');
insert into city (name) values ('Rehovot');
insert into city (name) values ('Karmiel');
insert into city (name) values ('Netanya');
insert into city (name) values ('Tiberias');
insert into city (name) values ('Ashdod');
insert into city (name) values ('Safed');
insert into city (name) values ('Ashkelon');
insert into city (name) values ('Ramla');

create table apartment (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	capacity INT,
	contact_info VARCHAR(50),
	city_id INT,
	FOREIGN KEY (city_id) REFERENCES city (id)
);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Maharastra',3,'1-317-652-0573',9),('GA',2,'1-262-256-2136',6),('Cesar',3,'1-876-524-2166',4),('Vienna',1,'1-975-492-7076',2),('IV',3,'1-297-426-5163',20),('Antioquia',1,'1-622-797-8471',20),('SP',3,'1-762-630-6298',17),('Metropolitana de Santiago',5,'1-901-623-4786',3),('SI',3,'1-625-722-6692',10),('Rajasthan',5,'1-763-552-9142',11);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('QLD',1,'1-101-990-4120',18),('Noord Holland',1,'1-330-984-3541',13),('Liguria',3,'1-134-694-0551',19),('Azad Kashmir',4,'1-847-520-6294',10),('Ontario',5,'1-886-287-8034',16),('Ceará',1,'1-739-117-1341',12),('Leinster',3,'1-268-613-3928',18),('Namen',3,'1-811-317-4618',4),('Arkhangelsk Oblast',3,'1-410-485-1215',1),('AB',4,'1-414-200-0761',2);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Queensland',1,'1-392-490-5906',4),('Stockholms län',5,'1-698-795-2123',6),('Valparaíso',3,'1-693-919-5036',8),('A',5,'1-260-471-4505',16),('CUS',4,'1-202-598-3190',12),('ON',5,'1-824-848-1054',6),('Kirkcudbrightshire',4,'1-181-387-8981',3),('SK',1,'1-553-334-7672',13),('VT',4,'1-935-546-2889',15),('Dalarnas län',4,'1-428-856-3242',15);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Volgograd Oblast',5,'1-406-593-5550',10),('NI',3,'1-994-325-4510',8),('Gye',3,'1-903-916-0681',2),('Norfolk',2,'1-910-320-7848',5),('MN',3,'1-592-923-2831',7),('Metropolitana de Santiago',3,'1-620-950-5236',12),('Gye',2,'1-121-222-6910',13),('NI',3,'1-704-453-3074',18),('Queensland',1,'1-761-703-8954',15),('Sląskie',3,'1-356-490-1397',21);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('ATL',1,'1-177-128-7291',12),('Bolívar',3,'1-202-860-5660',12),('East Java',1,'1-650-218-5746',7),('Sląskie',2,'1-374-223-6116',18),('Languedoc-Roussillon',5,'1-911-782-9981',14),('ANT',4,'1-312-957-0536',3),('Jalisco',3,'1-710-597-5672',17),('Jeo',4,'1-537-843-8519',2),('Kano',2,'1-370-872-5936',8),('L.',4,'1-356-767-7380',20);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('LEN',5,'1-485-183-1855',5),('SJ',5,'1-337-148-7820',2),('MU',1,'1-482-903-2976',18),('Gye',1,'1-986-869-2220',20),('LIM',2,'1-410-890-9275',4),('NV',5,'1-265-957-5453',11),('North Island',3,'1-857-446-0547',8),('Andhra Pradesh',4,'1-466-949-8778',7),('Alberta',2,'1-281-884-6047',6),('Vienna',1,'1-682-436-6469',5);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Ontario',1,'1-430-488-4450',5),('Missouri',5,'1-316-992-4502',19),('SP',2,'1-838-712-8795',17),('Puglia',4,'1-335-730-8940',18),('DE',5,'1-215-152-2892',18),('Atlántico',4,'1-162-903-7823',18),('AK',2,'1-264-157-7716',19),('ID',4,'1-876-721-3539',16),('CL',3,'1-754-248-6633',15),('San José',3,'1-631-978-5716',20);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('WY',1,'1-117-688-0802',18),('SH',4,'1-668-754-7655',4),('Northumberland',2,'1-324-984-5311',17),('Puno',2,'1-332-722-1664',11),('Principado de Asturias',2,'1-396-779-8693',11),('F',3,'1-652-879-0597',11),('O',5,'1-402-875-5584',18),('Maule',5,'1-718-427-7992',14),('Cusco',2,'1-650-423-6486',18),('Comunitat Valenciana',3,'1-973-526-6605',8);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('KPK',2,'1-511-279-3436',5),('Zuid Holland',3,'1-941-270-4932',8),('TN',3,'1-787-841-9152',1),('JB',3,'1-887-496-9261',21),('Antioquia',5,'1-954-905-7153',18),('Ankara',5,'1-229-551-5599',6),('Michoacán',3,'1-433-462-3025',3),('Wigtownshire',3,'1-448-628-9457',6),('LB',5,'1-630-615-5521',4),('Connacht',3,'1-473-784-0599',13);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Indiana',5,'1-514-726-9136',10),('F',4,'1-162-922-4240',8),('SJ',5,'1-783-374-6748',2),('Minas Gerais',3,'1-987-894-9659',14),('Wyoming',4,'1-114-529-2410',13),('KS',5,'1-747-182-6038',14),('Tam',2,'1-680-274-6998',17),('Antioquia',4,'1-254-307-5472',9),('ANC',5,'1-130-725-9144',19),('Östergötlands län',4,'1-117-166-7752',19);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Vlaams-Brabant',2,'1-466-631-2626',8),('Delaware',5,'1-211-642-4025',14),('Special Region of Yogyakarta',2,'1-104-156-2832',19),('Niger',4,'1-527-618-6873',8),('ON',1,'1-558-593-2691',7),('Los Lagos',5,'1-696-901-5351',3),('Pennsylvania',1,'1-401-605-7230',21),('C',1,'1-528-765-8368',12),('ON',3,'1-275-233-5469',3),('OY',4,'1-388-338-2437',16);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Nuevo León',5,'1-527-816-0795',17),('Ryazan Oblast',5,'1-728-955-8164',15),('Jeo',4,'1-726-983-8595',5),('Wie',1,'1-928-920-1694',9),('H',1,'1-613-869-5476',13),('Sin',1,'1-449-864-7110',1),('South Gyeongsang',4,'1-560-661-4536',11),('Gävleborgs län',3,'1-872-356-1345',7),('Salzburg',5,'1-433-956-2798',2),('North Gyeongsang',2,'1-132-530-3893',16);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Manitoba',1,'1-586-553-4317',21),('LOR',2,'1-463-345-4669',13),('MB',1,'1-725-853-3097',5),('Mexico City',5,'1-404-754-9115',9),('Cheshire',3,'1-760-730-5616',13),('West-Vlaanderen',3,'1-118-191-4941',5),('OH',3,'1-152-420-3440',15),('Jharkhand',3,'1-724-639-3105',8),('São Paulo',3,'1-848-567-7536',8),('CA',3,'1-541-333-4949',15);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Ver',1,'1-142-253-3945',5),('Quebec',3,'1-688-199-4076',17),('Bihar',3,'1-383-629-9680',17),('ANT',2,'1-312-572-6534',17),('NI',3,'1-382-734-8887',14),('Waals-Brabant',4,'1-207-154-2543',6),('AB',1,'1-614-394-1982',15),('South Island',1,'1-909-638-9612',10),('San José',5,'1-277-566-0575',3),('Selkirkshire',2,'1-689-834-9435',14);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('İzmir',4,'1-712-521-0930',5),('Ivanovo Oblast',1,'1-941-540-0028',16),('BA',5,'1-350-374-7884',13),('Zl',2,'1-556-401-5386',15),('Małopolskie',2,'1-457-434-7814',4),('Limousin',1,'1-872-546-9044',18),('QC',1,'1-284-762-6798',1),('LA',2,'1-569-881-1983',12),('São Paulo',2,'1-347-572-9766',11),('North Island',5,'1-253-796-8786',14);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('UT',4,'1-676-191-6619',8),('Lipetsk Oblast',2,'1-919-560-2062',2),('North Gyeongsang',1,'1-939-622-1797',5),('TN',2,'1-994-844-1734',11),('ANT',2,'1-455-429-1200',5),('Chiapas',2,'1-108-545-8737',14),('North Gyeongsang',1,'1-409-978-8936',18),('Luik',2,'1-565-444-1624',3),('Saskatchewan',5,'1-827-342-0364',6),('Gyeonggi',2,'1-439-739-6850',8);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('LD',3,'1-756-501-3563',11),('Son',2,'1-378-814-6005',11),('LAM',1,'1-138-441-0802',19),('U',3,'1-409-759-1042',16),('BOL',1,'1-326-142-1021',9),('CV',5,'1-620-534-4467',9),('Wie',2,'1-109-330-6317',20),('Balochistan',4,'1-793-375-2830',7),('PU',4,'1-230-686-1868',12),('Kerala',1,'1-202-195-0662',9);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Odisha',1,'1-106-636-3844',9),('RJ',1,'1-472-388-8772',2),('HB',1,'1-145-368-0697',17),('SP',2,'1-147-725-8019',14),('Kentucky',3,'1-418-417-7862',19),('North Jeolla',3,'1-590-324-9864',4),('Zl',2,'1-305-854-8962',7),('NÖ.',3,'1-918-414-2584',4),('SI',1,'1-150-721-8571',6),('L',1,'1-457-484-2205',8);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Oklahoma',5,'1-318-774-8807',7),('ANT',2,'1-441-706-7750',14),('L.',2,'1-446-402-6517',13),('MO',4,'1-676-630-7918',14),('LAL',1,'1-707-586-2615',8),('SI',4,'1-300-845-8204',10),('Heredia',2,'1-889-515-6536',15),('Hamburg',3,'1-388-632-9283',2),('PE',3,'1-681-774-5938',2),('Shetland',2,'1-231-810-5847',10);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('QLD',5,'1-931-323-6876',5),('LU',3,'1-759-520-0456',20),('ORL',3,'1-383-352-2432',6),('Berlin',2,'1-352-990-1724',5),('Katsina',1,'1-152-103-3221',15),('PU',3,'1-606-845-2871',11),('Jönköpings län',4,'1-494-680-4157',7),('Istanbul',1,'1-855-213-1418',8),('Luxemburg',1,'1-866-779-0648',5),('Saskatchewan',2,'1-676-763-1792',6);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Guanacaste',3,'1-931-471-2331',3),('Ontario',4,'1-367-601-6976',7),('ANC',2,'1-411-953-3984',6),('ZP',5,'1-443-724-6588',17),('Poitou-Charentes',3,'1-855-265-0090',11),('Vlaams-Brabant',5,'1-293-252-2538',14),('Pays de la Loire',3,'1-266-473-5299',14),('Brussels Hoofdstedelijk Gewest',5,'1-671-180-0441',9),('OG',2,'1-468-836-0607',13),('Ogun',3,'1-163-773-4514',8);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('CE',1,'1-118-200-2969',8),('Penza Oblast',1,'1-451-119-3452',7),('VIC',5,'1-649-839-1209',6),('Connacht',4,'1-524-963-8147',5),('Quebec',1,'1-438-500-6250',19),('JI',3,'1-954-612-2773',17),('Puglia',1,'1-805-250-0902',1),('ANT',4,'1-586-442-4478',5),('AS',2,'1-198-278-6522',1),('BA',4,'1-124-188-2121',3);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Aquitaine',1,'1-690-793-5072',3),('Heredia',4,'1-698-853-4094',14),('Waals-Brabant',4,'1-505-519-2303',17),('KY',4,'1-849-671-9512',18),('Kahramanmaraş',1,'1-778-977-6573',18),('PIU',3,'1-183-586-3871',6),('Sai',2,'1-979-200-4552',19),('Leinster',2,'1-190-607-8868',13),('Tver Oblast',4,'1-874-449-8711',11),('Kujawsko-pomorskie',2,'1-530-877-6355',10);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('PK',1,'1-689-615-1410',1),('Gye',3,'1-849-516-8735',10),('C',4,'1-449-794-0431',6),('Wie',1,'1-785-574-2822',18),('Gye',3,'1-985-928-8076',20),('Guanacaste',2,'1-916-625-4087',1),('Île-de-France',1,'1-998-769-6210',12),('FL',4,'1-357-288-0692',13),('C',1,'1-242-520-3877',5),('Pará',1,'1-140-457-5415',18);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('CUS',5,'1-672-664-3773',15),('Montana',1,'1-485-460-1755',21),('VB',4,'1-595-990-2241',5),('Île-de-France',2,'1-845-762-5703',5),('L',2,'1-115-442-1996',18),('MI',4,'1-723-413-2747',1),('L',5,'1-858-487-3820',20),('Madhya Pradesh',1,'1-288-874-2703',9),('Madrid',5,'1-477-246-9343',5),('L',3,'1-213-725-4975',1);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('CAQ',4,'1-184-559-9479',2),('Wie',3,'1-369-864-8372',7),('Istanbul',3,'1-412-543-7946',11),('Gyeonggi',4,'1-672-629-8072',17),('U',3,'1-708-771-2755',4),('AZ',1,'1-484-307-9627',8),('RI',4,'1-349-506-0242',20),('Lima',2,'1-172-828-6697',5),('CH',3,'1-398-329-6006',7),('LOR',5,'1-477-628-4183',21);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Ancash',1,'1-963-655-4291',4),('Oryol Oblast',5,'1-211-512-1021',15),('Montana',5,'1-352-531-1385',5),('VLA',4,'1-703-176-4968',3),('West Java',1,'1-643-358-3741',14),('South Australia',4,'1-552-593-8136',20),('Ankara',3,'1-931-890-9344',8),('LOR',5,'1-751-626-3156',11),('LAZ',5,'1-471-919-4363',19),('BR',2,'1-524-493-8829',13);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Western Australia',4,'1-460-686-9780',17),('HB',5,'1-676-469-2024',20),('Lower Austria',2,'1-640-410-5883',20),('NI',1,'1-232-336-5600',15),('N.L',5,'1-287-782-1078',19),('PA',3,'1-555-967-3307',5),('Catalunya',1,'1-533-983-8310',13),('ERM',5,'1-124-534-1999',12),('Gilgit Baltistan',4,'1-297-243-8530',2),('FA',1,'1-130-197-8058',18);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Jambi',1,'1-204-327-2383',7),('H',2,'1-322-335-0229',20),('Ontario',2,'1-474-525-2780',6),('Samsun',2,'1-584-858-3469',21),('C',3,'1-544-578-5446',9),('Connecticut',2,'1-207-119-9195',12),('BE',3,'1-577-558-9377',19),('Wie',4,'1-264-610-2883',1),('Mazowieckie',2,'1-512-151-1334',5),('HE',5,'1-286-176-0416',17);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Kemerovo Oblast',3,'1-257-123-1860',1),('Bretagne',1,'1-769-958-3011',20),('Iowa',1,'1-417-252-8100',6),('KT',1,'1-558-760-1263',20),('BOL',1,'1-446-882-7450',15),('Zeeland',3,'1-642-277-8782',18),('SL',2,'1-382-445-8875',18),('Antofagasta',3,'1-808-168-4832',8),('Bedfordshire',4,'1-915-670-1142',4),('Wie',4,'1-606-847-5117',13);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Comunitat Valenciana',3,'1-739-815-0635',4),('OR',2,'1-541-341-6723',15),('WB',2,'1-650-578-0162',17),('L.',3,'1-766-183-3001',11),('Van',5,'1-316-443-1877',13),('Franche-Comté',3,'1-138-235-8651',12),('Delta',5,'1-435-227-9133',4),('Kano',5,'1-324-515-4399',13),('Extremadura',2,'1-299-382-0243',2),('SA',4,'1-362-680-9505',14);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('MP',2,'1-169-280-3277',4),('VII',5,'1-377-315-0586',15),('PB',1,'1-907-400-0081',16),('MP',5,'1-772-957-6086',4),('WO',5,'1-178-997-5817',3),('łódzkie',3,'1-712-870-5558',2),('Sindh',4,'1-745-947-8010',12),('Jammu and Kashmir',3,'1-444-266-1777',1),('Gye',4,'1-153-558-9571',10),('Hamburg',1,'1-260-266-2143',17);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Gl',3,'1-686-750-4304',1),('XIV',2,'1-821-876-0289',17),('Oryol Oblast',5,'1-162-150-3909',17),('PE',4,'1-469-308-3948',20),('AR',1,'1-176-181-7625',6),('Wie',1,'1-863-567-9487',6),('L',1,'1-784-833-7999',10),('UP',4,'1-934-421-1261',21),('Castilla y León',5,'1-133-252-9200',18),('HH',4,'1-706-874-4997',20);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('İzmir',2,'1-895-195-0376',12),('Ist',4,'1-667-830-3409',13),('MH',3,'1-111-746-9753',5),('Karnataka',5,'1-541-187-5288',5),('KEM',1,'1-824-683-0822',16),('Lima',1,'1-162-298-4201',13),('AN',1,'1-932-843-6245',13),('Dolnośląskie',3,'1-626-636-5549',7),('LIM',3,'1-853-855-0121',19),('Heredia',2,'1-668-272-1744',11);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Sicilia',1,'1-767-523-5388',19),('Burgenland',5,'1-809-538-0115',17),('Bihar',1,'1-854-141-9772',6),('AN',3,'1-257-837-4806',8),('BA',2,'1-654-122-3468',15),('Gye',4,'1-567-643-7299',4),('Konya',1,'1-971-443-7620',19),('Bahia',4,'1-974-581-2160',15),('Arkansas',2,'1-529-488-6167',20),('TAM',4,'1-430-834-3994',19);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('CAM',5,'1-573-450-9320',2),('OK',2,'1-591-980-7232',3),('Selkirkshire',3,'1-769-477-9668',20),('İzmir',4,'1-948-619-5602',4),('MO',3,'1-719-255-3906',17),('PE',1,'1-240-194-8770',21),('SS',2,'1-751-760-2338',8),('Bauchi',1,'1-315-176-5679',4),('Emilia-Romagna',1,'1-720-806-7041',11),('Tamaulipas',1,'1-796-919-7351',18);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('ANT',1,'1-845-155-1565',6),('CA',4,'1-537-707-8760',12),('QLD',5,'1-868-407-9050',13),('Alabama',3,'1-923-281-3771',12),('ON',2,'1-931-985-8744',1),('CT',2,'1-241-161-6574',9),('Hampshire',1,'1-936-371-1418',9),('Sindh',3,'1-725-165-2089',2),('Son',3,'1-846-404-1427',14),('S.L',1,'1-142-381-7636',20);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Nuevo León',4,'1-386-507-0558',5),('Jigawa',1,'1-126-270-0493',16),('UP',5,'1-743-966-5501',14),('LEN',4,'1-503-281-9033',5),('Munster',2,'1-195-585-1792',9),('İzm',2,'1-217-676-1056',17),('Heredia',5,'1-424-252-1450',14),('RJ',4,'1-925-186-1377',2),('Arequipa',2,'1-703-217-4633',8),('MT',5,'1-349-963-8400',2);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('SIC',3,'1-364-216-3784',6),('C',3,'1-385-589-1232',4),('Östergötlands län',3,'1-526-463-5726',3),('MT',3,'1-348-187-2154',15),('TOL',4,'1-808-192-4779',6),('Veneto',4,'1-248-214-1675',3),('Overijssel',2,'1-240-690-9604',18),('Jeju',1,'1-927-784-7474',14),('QLD',4,'1-658-412-3493',8),('Zeeland',3,'1-339-869-0994',1);
INSERT INTO "apartment" (name,capacity,contact_info,city_id) VALUES ('Michigan',2,'1-854-272-5465',5),('Zl',4,'1-761-690-2456',16),('RJ',4,'1-916-797-5522',7),('Biobío',4,'1-242-655-3073',21),('Zl',1,'1-834-475-6589',14),('OV',1,'1-654-812-5420',10),('Arkansas',2,'1-788-594-1902',10),('Vienna',1,'1-210-681-1920',14),('Västra Götalands län',4,'1-772-600-6451',6),('Ceará',2,'1-591-665-8890',5);



create table reservation (
	id SERIAL PRIMARY KEY,
	apartment_id INT,
	arriving_date DATE,
	leaving_date DATE,
	FOREIGN KEY (apartment_id) REFERENCES apartment (id)
);


COMMIT;