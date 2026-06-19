SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [BikeStores].[dbo].[KHACHHANG_OAKLAND]

  DELETE FROM [KHACHHANG_OAKLAND]
  WHERE [first_name] LIKE 'Ka%'

  UPDATE [KHACHHANG_OAKLAND]
  SET [first_name] = 'Peter'
  WHERE [first_name] ='Philip'

 DELETE FROM [KHACHHANG_OAKLAND];

INSERT INTO KHACHHANG_OAKLAND
([first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code])
VALUES
('A','Nguyen','0901111111','a@gmail.com','1 Street','Oakland','CA','94601'),
('B','Nguyen','0902222222','b@gmail.com','2 Street','Oakland','CA','94602'),
('C','Nguyen','0903333333','c@gmail.com','3 Street','Oakland','CA','94603'),
('D','Nguyen','0904444444','d@gmail.com','4 Street','Oakland','CA','94604'),
('E','Nguyen','0905555555','e@gmail.com','5 Street','Oakland','CA','94605'),
('F','Nguyen','0906666666','f@gmail.com','6 Street','Oakland','CA','94606'),
('G','Nguyen','0907777777','g@gmail.com','7 Street','Oakland','CA','94607'),
('H','Nguyen','0908888888','h@gmail.com','8 Street','Oakland','CA','94608'),
('I','Nguyen','0909999999','i@gmail.com','9 Street','Oakland','CA','94609'),
('J','Nguyen','0910000000','j@gmail.com','10 Street','Oakland','CA','94610');