CREATE TABLE [users] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [role_id] int NOT NULL,
  [name] nvarchar(100) NOT NULL,
  [phone] nvarchar(20),
  [email] nvarchar(320) NOT NULL,
  [password] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [roles] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL
)
GO

CREATE TABLE [books] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [title] nvarchar(200) NOT NULL,
  [author_id] int,
  [pub_year] int,
  [description] nvarchar(500)
)
GO

CREATE TABLE [genres] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [genre] nvarchar(50) NOT NULL
)
GO

CREATE TABLE [authors] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) NOT NULL,
  [last_name] nvarchar(100)
)
GO

CREATE TABLE [stores] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) NOT NULL,
  [street] nvarchar(100),
  [city] int,
  [state_id] int NOT NULL,
  [country] int NOT NULL,
  [zipcode] nvarchar(20) NOT NULL
)
GO

CREATE TABLE [cities] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [city] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [states] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [state] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [countries] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [country] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [inventory] (
  [store_id] int NOT NULL,
  [book_id] int NOT NULL,
  [quantity] int NOT NULL,
  PRIMARY KEY ([store_id], [book_id])
)
GO

CREATE TABLE [reservation] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [user_id] int NOT NULL,
  [store_id] int NOT NULL,
  [book_id] int NOT NULL,
  [quantity] int NOT NULL,
  [status_id] int NOT NULL,
  [created_at] datetime NOT NULL
)
GO

CREATE TABLE [reservation_status] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL
)
GO

CREATE TABLE [book_genres] (
  [book_id] int,
  [genre_id] int,
  PRIMARY KEY ([book_id], [genre_id]),
  FOREIGN KEY ([book_id]) REFERENCES [books] ([id]),
  FOREIGN KEY ([genre_id]) REFERENCES [genres] ([id])
)
GO

ALTER TABLE [users] ADD FOREIGN KEY ([role_id]) REFERENCES [roles] ([id])
GO

ALTER TABLE [books] ADD FOREIGN KEY ([author_id]) REFERENCES [authors] ([id])
GO

ALTER TABLE [stores] ADD FOREIGN KEY ([city]) REFERENCES [cities] ([id])
GO

ALTER TABLE [stores] ADD FOREIGN KEY ([state_id]) REFERENCES [states] ([id])
GO

ALTER TABLE [stores] ADD FOREIGN KEY ([country]) REFERENCES [countries] ([id])
GO

ALTER TABLE [inventory] ADD FOREIGN KEY ([store_id]) REFERENCES [stores] ([id])
GO

ALTER TABLE [inventory] ADD FOREIGN KEY ([book_id]) REFERENCES [books] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([store_id]) REFERENCES [stores] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([book_id]) REFERENCES [books] ([id])
GO

ALTER TABLE [reservation] ADD FOREIGN KEY ([status_id]) REFERENCES [reservation_status] ([id])
