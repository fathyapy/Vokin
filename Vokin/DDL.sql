GO
CREATE DATABASE [VOkin]

GO
USE [VOkin]

go
create table [MsCustomer](
	[CustomerID] char(5) primary key check([CustomerID] like 'CU[0-9][0-9][0-9]') not null,
	[CustomerName] varchar(100) not null,
	[CustomerDOB] date not null,
	[CustomerPhone] varchar(20) not null,
	[CustomerGender] varchar(20) check([CustomerGender] in('male', 'female')) not null
)

go
create table [MsStaff](
	[StaffID] char(5) primary key check([StaffID] like 'ST[0-9][0-9][0-9]') not null,
	[StaffName] varchar(100) not null,
	[StaffDOB] date not null,
	[StaffPhone] varchar(20) not null,
	[StaffGender] varchar(20) check([StaffGender] in('male', 'female')) not null,
	[StaffSalary] int not null
)

go
create table [MsVariant](
	[VariantID] char(5) primary key check([VariantID] like 'VA[0-9][0-9][0-9]') not null,
	[VariantName] varchar(50) not null
)

go
create table [MsProduct](
	[ProductID] char(5) primary key check([ProductID] like 'PR[0-9][0-9][0-9]') not null,
	[VariantID] char(5) foreign key references [MsVariant]([VariantID]) on update cascade on delete cascade not null,
	[ProductName] varchar(100) not null,
	[ProductPrice] int not null
)

go
create table [TransactionHeader](
	[TransactionID] char(5) primary key check([TransactionID] like 'TR[0-9][0-9][0-9]') not null,
	[CustomerID] char(5) foreign key references [MsCustomer]([CustomerID]) on update cascade on delete cascade not null,
	[StaffID] char(5) foreign key references [MsStaff]([StaffID]) on update cascade on delete cascade not null,
	[TransactionDate] date not null
)

go
create table [TransactionDetail](
	[TransactionID] char(5) foreign key references [TransactionHeader]([TransactionID]) on update cascade on delete cascade not null,
	[ProductID] char(5) foreign key references [MsProduct]([ProductID]) on update cascade on delete cascade not null,
	[Quantity] int not null,
	primary key([TransactionID], [ProductID])
)

go
insert into [MsCustomer] values('CU001', 'Andre Setiawan Wijaya', '2002-01-01', '+6281908856868', 'male')
insert into [MsCustomer] values('CU002', 'Erwin', '2001-01-10', '+6282122221610', 'male')
insert into [MsCustomer] values('CU003', 'Felix Novando', '2001-11-24', '+6285269374552', 'male')
insert into [MsCustomer] values('CU004', 'Veronica', '2001-07-28', '+6281289075249', 'female')
insert into [MsCustomer] values('CU005', 'Julieta', '2002-07-10', '+62818190999', 'female')
insert into [MsCustomer] values('CU006', 'Hansen Artajaya', '2002-10-06', '+6289618521447', 'male')
insert into [MsCustomer] values('CU007', 'Jose Giancarlos', '2002-03-30', '+6281296204300', 'male')
insert into [MsCustomer] values('CU008', 'Chelsey', '2002-11-18', '+6283898987977', 'female')
insert into [MsCustomer] values('CU009', 'Adewirya Niko Sidharta', '2003-02-08', '+6282221942330', 'male')
insert into [MsCustomer] values('CU010','Maverick Sean Therry', '2002-12-01', '+6281283861646', 'male')

go
insert into [MsStaff] values('ST001', 'Brandon Julio Thenaro', '2001-07-07', '+628296132135', 'male', 5000000)
insert into [MsStaff] values('ST002', 'Lionel Richie', '2001-02-25', '+628131380901', 'male', 6000000)
insert into [MsStaff] values('ST003', 'Clarissa Chuardi', '2001-08-26', '+628176707300', 'female', 7000000)
insert into [MsStaff] values('ST004', 'Skolastika Gabriella Theresandia Prasetyo', '2001-01-27', '+628995248431', 'female', 8000000)
insert into [MsStaff] values('ST005', 'Johanes Peter Vincentius', '2001-04-03', '+628073036003', 'male', 9000000)
insert into [MsStaff] values('ST006', 'Stanley Dave Teherag', '2001-09-12', '+628216683785', 'male', 10000000)
insert into [MsStaff] values('ST007', 'Vincent Benedict', '2000-11-21', '+628989985747', 'male', 11000000)
insert into [MsStaff] values('ST008', 'Thaddeus Cleo', '2000-12-22', '+628305210161', 'male', 12000000)
insert into [MsStaff] values('ST009', 'Sisca Wijaya', '1999-04-12', '+628131273906', 'female', 13000000)
insert into [MsStaff] values('ST010', 'Nicholas', '2006-01-10', '+628177511229', 'male', 15000000)

go
insert into [MsVariant] values('VA001', 'Hydrating')
insert into [MsVariant] values('VA002', 'Relaxing')
insert into [MsVariant] values('VA003', 'Balancing')
insert into [MsVariant] values('VA004', 'Calming')
insert into [MsVariant] values('VA005', 'Nurturing')

go
insert into [MsProduct] values('PR001', 'VA003', 'VOkin tea tree & lemon facial cleanser', 130000)
insert into [MsProduct] values('PR002', 'VA002', 'VOkin tea tree & lemon facil c-serum', 180000)
insert into [MsProduct] values('PR003', 'VA004', 'VOkin green tea & tamarind facial cleanser', 130000)
insert into [MsProduct] values('PR004', 'VA004', 'VOkin coconut & vanilla facial scrub', 120000)
insert into [MsProduct] values('PR005', 'VA004', 'VOkin chamomile facial toner', 160000)
insert into [MsProduct] values('PR006', 'VA001', 'VOkin aloe facial mist', 100000)
insert into [MsProduct] values('PR007', 'VA004', 'VOkin moringa face mask', 120000)
insert into [MsProduct] values('PR008', 'VA004', 'VOkin mugwort facemask', 120000)
insert into [MsProduct] values('PR009', 'VA001', 'VOkin wildrose face toner', 160000)
insert into [MsProduct] values('PR010', 'VA004', 'VOkin saffron facial mist', 100000)

go
insert into [TransactionHeader] values('TR001', 'CU001', 'ST007', '2021-07-16')
insert into [TransactionHeader] values('TR002', 'CU001', 'ST003', '2021-07-16')
insert into [TransactionHeader] values('TR003', 'CU002', 'ST001', '2021-07-23')
insert into [TransactionHeader] values('TR004', 'CU003', 'ST002', '2021-07-28')
insert into [TransactionHeader] values('TR005', 'CU005', 'ST007', '2021-07-01')
insert into [TransactionHeader] values('TR006', 'CU006', 'ST008', '2021-07-02')
insert into [TransactionHeader] values('TR007', 'CU006', 'ST009', '2021-07-05')
insert into [TransactionHeader] values('TR008', 'CU007', 'ST002', '2021-08-06')
insert into [TransactionHeader] values('TR009', 'CU008', 'ST007', '2021-08-07')
insert into [TransactionHeader] values('TR010', 'CU008', 'ST006', '2021-08-08')
insert into [TransactionHeader] values('TR011', 'CU009', 'ST002', '2021-08-09')
insert into [TransactionHeader] values('TR012', 'CU009', 'ST009', '2021-08-10')
insert into [TransactionHeader] values('TR013', 'CU009', 'ST008', '2021-08-11')
insert into [TransactionHeader] values('TR014', 'CU010', 'ST006', '2021-08-12')
insert into [TransactionHeader] values('TR015', 'CU010', 'ST005', '2021-08-17')

go
insert into [TransactionDetail] values('TR001', 'PR001', 1)
insert into [TransactionDetail] values('TR001', 'PR006', 2)
insert into [TransactionDetail] values('TR002', 'PR002', 2)
insert into [TransactionDetail] values('TR003', 'PR003', 3)
insert into [TransactionDetail] values('TR004', 'PR009', 2)
insert into [TransactionDetail] values('TR005', 'PR004', 1)
insert into [TransactionDetail] values('TR006', 'PR001', 2)
insert into [TransactionDetail] values('TR006', 'PR002', 1)
insert into [TransactionDetail] values('TR007', 'PR006', 3)
insert into [TransactionDetail] values('TR008', 'PR002', 1)
insert into [TransactionDetail] values('TR008', 'PR003', 1)
insert into [TransactionDetail] values('TR009', 'PR001', 1)
insert into [TransactionDetail] values('TR009', 'PR004', 1)
insert into [TransactionDetail] values('TR009', 'PR007', 1)
insert into [TransactionDetail] values('TR010', 'PR001', 2)
insert into [TransactionDetail] values('TR010', 'PR008', 1)
insert into [TransactionDetail] values('TR011', 'PR001', 2)
insert into [TransactionDetail] values('TR011', 'PR006', 1)
insert into [TransactionDetail] values('TR012', 'PR001', 2)
insert into [TransactionDetail] values('TR012', 'PR003', 1)
insert into [TransactionDetail] values('TR012', 'PR006', 1)
insert into [TransactionDetail] values('TR013', 'PR003', 2)
insert into [TransactionDetail] values('TR014', 'PR003', 2)
insert into [TransactionDetail] values('TR015', 'PR001', 1)
insert into [TransactionDetail] values('TR015', 'PR005', 1)

GO
EXEC sp_MSforeachtable 'SELECT * FROM ?'