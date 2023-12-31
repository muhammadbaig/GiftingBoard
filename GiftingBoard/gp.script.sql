USE [GiftingBoard]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Board]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Board](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[BoardValueId] [int] NOT NULL,
	[Isexpired] [bit] NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Board] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoardValue]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BoardValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BoardValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Members]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[memberId] [nvarchar](128) NOT NULL,
	[BoardId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[isCoremember] [bit] NOT NULL,
	[corememberId] [nvarchar](128) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Conversation]    Script Date: 4/1/2021 2:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Conversation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Msg] [nvarchar](max) NULL,
	[MsgDate] [nvarchar](50) NULL,
	[SenderID] [nvarchar](128) NULL,
	[ReceiverID] [nvarchar](128) NULL,
 CONSTRAINT [PK_tbl_Conversation_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202012240415592_InitialCreate', N'GiftingBoard.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829ECE3948AD5CCE2EB681BD45D649DAE06C2E586717E76D414BB443AC44A912952628FACBFAD09FD4BFD0A144C9122FBAD88AED140B2C2C72F8CD70382487C361FEFCFD8FF10F4F816F3DE23821219DD847A343DBC2D40D3D4297133B658BEFDED93FBCFFE73FC6175EF0647D29E84E381DB4A4C9C47E602C3A759CC47DC0014A460171E33009176CE4868183BCD0393E3CFCDE393A723040D8806559E34F296524C0D9077C4E43EAE288A5C8BF0E3DEC27A21C6A6619AA7583029C44C8C513FB47B26020DC8710C5DE2827B7AD339F20106586FD856D214A438618087AFA39C133168774398BA000F9F7CF1106BA05F2132C3A70BA22EFDA97C363DE1767D5B08072D38485414FC0A313A11C476EBE968AED5279A0BE0B50337BE6BDCE5438B1AF3C9C157D0A7D5080CCF074EAC79C78625F972CCE92E806B351D17094435EC600F74B187F1B55110FACCEED0E4A633A1E1DF27F07D634F5591AE309C5298B917F60DDA5739FB8FFC3CFF7E1374C272747F3C5C9BB376F9177F2F6BFF8E44DB5A7D057A0AB1540D15D1C463806D9F0A2ECBF6D39F5768EDCB06C5669936B056C094CCFB6AED1D3474C97EC0166CCF13BDBBA244FD82B4A84717DA604A6113462710A9F37A9EFA3B98FCB7AA79127FFBF81EBF19BB78370BD418F64990DBDC41F264E0CF3EA13F6B3DAE48144F9F4AA8DF7574176198701FFAEDB575EFB7516A6B1CB3B131A49EE51BCC4AC2EDDD859196F2793E650C39B7581BAFFA6CD2555CD5B4BCA3BB4CE4C28586C7B3614F2BE2CDFCE1677164530789969718D34199C66B71A49CD0FAC2AD1CA788EBA1A0F854EFD9DD7C28B00117F80C5B00317704416240E70D9CB0F21981EA2BD65BE4349026B81F7134A1E1A44879F03883EC36E1A8389CE180AA217E776F710527C9306736EF9DBE335D8D0DCFF125E229785F105E5AD36C6FB18BADFC2945D50EF1C31FC99B90520FFBC2741778041C439735D9C249760CCD89B86E067178057949D1CF786E32BD4AE9D91A98F48A0F746A4B5F46B41BAF248F4148A576220D379264DA27E0C97847613B520358B9A53B48A2AC8FA8ACAC1BA492A28CD826604AD72E65483F97AD9080DEFEC65B0FBEFED6DB6799BD6828A1A67B042E21F31C5312C63DE1D620CC77435025DD68D5D380BD9F071A62FBE37659CBE203F1D9AD55AB3215B04869F0D19ECFECF864C4C287E241EF74A3A1C810A6280EF44AF3F5DB5CF3949B26D4F875A37B7CD7C3B6B8069BA9C2549E8926C1668825F227451971F7C38AB3D8E91F7468E8540C7C0D009DFF2A004FA66CB46754BCFB18F19B6CEDC3C383845898B3C558DD021AF8760C58EAA116C1513A90BF71F8527583A8E7923C40F4109CC5442993A2D08754984FC562D492D3B6E61BCEF250FB9E61C47987286AD9AE8C25C1F02E102947CA44169D3D0D8A9585CB3211ABC56D398B7B9B0AB715722135BB1C916DFD96097C27F7B11C36CD6D8168CB359255D043086F37661A0E2ACD2D500E483CBBE19A874623218A870A9B662A0758DEDC040EB2A7975069A1F51BB8EBF745EDD37F3AC1F94B7BFAD37AA6B07B659D3C79E9966EE7B421B062D70AC9AE7F99C57E227A6399C819CE27C9608575736110E3EC3AC1EB259F9BB5A3FD46906918DA8097065682DA0E22250015226540FE18A585EA374C28BE8015BC4DD1A61C5DA2FC1566C40C5AE5E885608CDD7A6B271763A7D943D2BAD4131F24E87850A8EC620E4C5ABDEF10E4A31C56555C574F185FB78C3958E89C16850508BE76A5052D199C1B5549866BB96740E591F976C232D49EE93414B456706D792B0D17625699C821E6EC1462AAA6FE1034DB622D251EE3665DDD8C913A544C1D83164548DAF511411BAAC645889126B96A7574DBF9BF54F3B0A720CC74D34D947A5B4252716C66889A55A600D925E923861E788A139E2719EA9172864DABDD5B0FC172CABDBA73A88C53E5050F3DF790BDDF57D6DB355BD110172095D0CB84B93C5D13506A06F6EF19437E4A35813BA9F867E1A50B387656E9D5FE055DBE7252AC2D891E4573C28455D8A9F5BD77DA7915167C550A3547A30EB8F9419C2A4EFC2FFAC6ADCE4939A518A105515C514B6DAD9C8995C997EA325BB89FD07AB15E1656696C84DA90288A29E1895F40605AC52D71DB59E8152C5ACD7744794D24CAA9052550F29ABC9243521AB156BE11934AAA7E8CE414D1FA9A2ABB5DD9135892455684DF51AD81A99E5BAEEA89A5C932AB0A6BA3BF62AF1445E45F778EF321E5ED6DFBCF203EE66BB9701E36596C46136BFCA3D7E15A852DC134BDCD42B60A27C2FCDC978CA5BDF9CF2C0C666E664C030AF3DB52BF0FAD2D3786F6FC6ACDD6BD796F7A67B7D335E3FA37D51D3504E793249C9BD3CED49A7BAB13861B53FA6518E5C39896D156A84ADFD396138187182D1EC677FEA13CC17F282E01A51B2C009CB7339ECE3C3A363E939CEFE3C8D7192C4F3352754D3FB98FA986D212D8B3EA2D87D40B19A24B1C1F39115A8127FBEA21E7E9AD8BF66AD4EB35006FF95151F5857C9674A7E4EA1E23E4EB1F59B9AF4394C3A7D87071CA5A0BFBD8A9711DD557EF5FFAF79D303EB3686E9746A1D4A8A5E67F8EBEF257A499337DD409AB55F51BCDED9567BA0A0459566CBFAEF11E6840DF216A190F25F017AFA775FD1B4EF0D3642D4BC29180A6F10159ADE0CAC83657C2FE0C127CBDE0BF4EBACFEFDC03AA219DF0E10DA1F4C7E39D07D192A5AEE701FD29C98B6B124657A6ECDBCDE280D73D77B9392A0BDD1445793B07BC00D9A68BD998BF2CA129807DB3A35F9C98361EFD2EE5F3C29795FF290574EFB6ED38FB79971DC70A7F4B74A34DE83D4384DAACFEED389B76D6BA610F09EE764F64B1ADE336313DBFCEE5383B76D6CA600F19E1B5BAF04E03DB3B55DED9F3BB6B4CE5BE8CED379D5CC24C3558E2E8ADC96AE9B87DCE1F83F0FC108728F327F65A9CF0F6BCA6D6D61B82231333527A6C98C9589A3F055289AD9F6EBABD8F01B3B2B689AD91AD2399B788BF5BF91B7A069E66D4892DC45A2B1364D5197FCDDB28E356550BDA6C4E25A4F5AF2D8DB7CD6C67BF9D794473C88526AB3C770BBFC7AD2860751C99053A7479AB07A510C7B67E56F33C2FE9D90E50A82FFA5468ADDDAAE59D25CD145586CDE9244058914A1B9C60C79B0A59EC58C2C90CBA09A07A0B367E259508F5F83CCB177456F5316A50CBA8C83B95F0B787127A0897F960B5D97797C1BF1AF64882E80988407EE6FE98794F85E29F7A526266480E0DE8508F7F2B1643CECBB7C2E916E42DA1148A8AF748AEE7110F90096DCD2197AC4EBC806E6F7112F91FBBC8A009A40DA07A2AEF6F13941CB180589C058B5874FB0612F787AFF17AE725408A2540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0c50dc80-b150-48f9-a957-660b7fd67d07', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1212b9ff-7d49-446b-9d9b-0ebe19029623', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'15a85b9b-a4a4-44d0-a6e1-9dd71d955904', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c86eb71-f0dd-47ef-b6a6-42d03348c312', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2aaf01f3-8602-480d-a060-f3e1271463b6', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3811ac89-161d-4469-b9cd-9141f8ea06cf', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3863aa8b-2ca7-48d5-bee1-61877930e042', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3d59f254-eaea-48d6-908f-74d83740e9bd', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4e574a22-a8f2-4bf0-9f78-d6bff8f85dd7', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4e74589d-e86a-47db-a6a2-ba5cc191c0ca', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5370f025-fee7-4bd2-b3e7-9c14aafc3104', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5712dcbb-b3f5-46c3-80f6-af6c334bf242', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'62acdb24-bf71-49ab-9f14-19cf2db32cf7', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6d16b3fd-4e52-4408-8d52-9ca8817b368c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'70babb61-1c76-4d48-9777-471346176d0b', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'755ae934-6e74-4943-bb11-58ecd67f235a', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7e8930f1-0fdc-4341-9db6-3cae7e784f57', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8921469f-d70d-4eb3-84c2-99da9a94b4ae', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a0a96142-5dd2-4cff-a8a5-cfa85644fd09', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a3fc7977-ab5b-42da-b0f1-881f1bb9054c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b7a048bb-e7f6-4055-81ae-cff2fab7afe1', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c2aeb231-0097-49d8-9c6e-855f054767ac', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c3d5c1a1-fe41-4007-aee7-c35c1ae4e249', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c7030748-a5f3-4b6e-8186-917509dcacf4', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cb95f3e0-e4b3-4a46-a1dc-3dc624dc9d45', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cc684418-8cf2-4d6c-b218-f90ee0e8a855', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd0350c18-1374-40ec-81a9-c25305886aee', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'de24fe89-a4ce-42ba-b929-136f638e1f13', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0bd3004-92b9-429e-916c-dfaff817d9e6', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e124bcb8-fa6d-48c4-b682-19f4d0ba4ecb', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6393661-524d-4c35-97a9-dacc909db40c', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e899aa9a-f87f-4634-bfcc-0bb4c1e554f4', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f303753e-4840-49f5-ab1a-b3d8e516db72', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f5b0802d-f5cd-4c61-9b74-6b13878fb800', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'admin@gmail.com', 0, N'AHa7g/RO4S30IEqOxiKnLE0aP9zRkk6kdHvmlMELRDUajIMR1a+XWYE0Zcb3p7cH4g==', N'eb414f3c-a048-4606-af61-985f8c56c39c', N'13123242', 0, 0, NULL, 1, 0, N'admin@gmail.com', N'Admin', N'Admin1', N'/Content/UploadProfile/admin@gmail.commarc.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'0c50dc80-b150-48f9-a957-660b7fd67d07', N'susan@gmail.com', 0, N'AL3E6EjXoL1vegoxLoHyAlKNruGBYTVehF3GgGr9O0vsT/m+wBF3f1ZlJrYY523ufg==', N'cbef030f-d2b8-4ac8-9dbb-a9c98358e454', N'1234', 0, 0, NULL, 1, 0, N'susan', N'susan', N'susan', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'1212b9ff-7d49-446b-9d9b-0ebe19029623', N'warner@gmail.com', 0, N'AC+r3xNddgSCzq6U9OKuaafa0uwLxE002cXHQr6RMzLrC0NqDyL/Wk8VSg2vijQBRA==', N'656162d1-ab39-481d-a6f7-f3b95001a379', N'123242352', 0, 0, NULL, 1, 0, N'warner12', N'warner', N'warner', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'15a85b9b-a4a4-44d0-a6e1-9dd71d955904', N'emma@gmail.com', 0, N'AGA870KpMTUhDS7QvYPh+Eb5EaG4ANM0UZq6BF2TF1C7OT5X70cZua85WAnLZIKC2A==', N'309f5eee-97a5-4da4-a420-9a06f93ca71c', N'123456', 0, 0, NULL, 1, 0, N'emma12', N'Emma', N'tania', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'1c86eb71-f0dd-47ef-b6a6-42d03348c312', N'jikey@gamail.com', 0, N'AINW44Yg2glLIWw5SVZZ8WqrdLgL8mMdPDqrbktGQZMuhdrRnk2C8qihUSb9eGq6DQ==', N'602b31d5-7723-421a-9438-63362089b68a', N'214', 0, 0, NULL, 1, 0, N'jikey', N'jikey', N'jikey', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'2aaf01f3-8602-480d-a060-f3e1271463b6', N'samith@gmail.com', 0, N'ABuIhTqYzA/QZoYgWuIKipkvqDmN3YLlsVvjrf37PhJaTFrgt0cJCiw2tFSrXoA6Ng==', N'e4204013-ad32-4f1f-b476-7793880437eb', N'123456', 0, 0, NULL, 1, 0, N'samith', N'samith', N'samith', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'3811ac89-161d-4469-b9cd-9141f8ea06cf', N'rohid@gmail.com', 0, N'AIApkTILmzDlmv9D1TLbDaeVRWp7Ye0kzUfvCm9klhYBZexRMsDgth32A5NZDDv2Dg==', N'b09e9e01-a446-434c-8f9f-154e1c9a2b22', N'1214', 0, 0, NULL, 1, 0, N'rohid', N'rohid', N'rohid', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'3863aa8b-2ca7-48d5-bee1-61877930e042', N'wata@gmai.com', 0, N'AHzJXEYnlq0+GnXyoxMjKW5n6jmzqZTifp8A1a44zyl7wZTPxo3gKnhRoWBZSOj9Bg==', N'faf27c7a-7a69-45ff-bc14-2e283f3c8328', N'1224657', 0, 0, NULL, 1, 0, N'wata', N'wata', N'wata', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'3d59f254-eaea-48d6-908f-74d83740e9bd', N'Tuser2@gmail.com', 0, N'AN9q867dQ9MKeJh9Ft1yTwjHj8sVsN5taNsvP27hltaRYi/VWMMK1FGtxsaytCYN4A==', N'24dd009b-e620-4df2-a67f-439c3e9420e5', N'12124', 0, 0, NULL, 1, 0, N'Tuser2', N'Tuser2', N'Tuser2', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'david@gmail.com', 0, N'AL5bdbI4uCOf/cuXI5zXXAxpHlibD++ZwYA6jEK0F19PIOjweoLefgbvv4uv9uIv1w==', N'7434500f-ccfb-426d-994f-df10b81e93b6', N'1214124141', 0, 0, NULL, 1, 0, N'david', N'david', N'david', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'4e574a22-a8f2-4bf0-9f78-d6bff8f85dd7', N'rimsha@gmail.com', 0, N'AGlVfQsV+asrw8lue9vcNweDSrRv1wOcpaZTFZAaLAtYrspEdYo/bU3ha4aSIrapMA==', N'99b2cad5-2a39-451a-8adf-7a967e56cd5b', N'43234', 0, 0, NULL, 1, 0, N'rimsha', N'rimsha', N'rimsha', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'4e74589d-e86a-47db-a6a2-ba5cc191c0ca', N'sahar@gmail.com', 0, N'ACgB26VFgtgoIa7u8F6ecI6HTvI/3dX/IHy8YmvYhk7VA6U8OVsNIr1gmICZ7UbjeA==', N'e7ad7c4e-dd10-4546-aadf-0424f0ed238d', N'21313', 0, 0, NULL, 1, 0, N'sahar', N'sahar', N'sahar', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'5370f025-fee7-4bd2-b3e7-9c14aafc3104', N'patlo@gmail.com', 0, N'AGVTAcjnvASS7EYRUlICTpPPAqAjSvR2pgVYfcN0E4vy+cVYTy9Vsh0/pOipO856dQ==', N'e3bb8ac3-ae28-449c-84a6-e8875c54cd72', N'1324324', 0, 0, NULL, 1, 0, N'patlo', N'patlo', N'patlo', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f', N'bigshow@gmail.com', 0, N'AGr76eKa+WhoFkFflVSUwaJ6FyNJIESwpLz6YRuPCuMGN9Rx49J9XiBjBmMTSONukQ==', N'5611bdf9-86cb-42c3-827b-106ab59fefbd', N'1212414', 0, 0, NULL, 1, 0, N'bigshow', N'bigshow', N'bigshow', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'5712dcbb-b3f5-46c3-80f6-af6c334bf242', N'tania@gmail.com', 0, N'AAXDLiR8/yWeF3UEb37ngLXajrnxNH5atuyFS/BPbow4vcG0mh5QFzpq217Ta5t/iQ==', N'1eec96ce-8c9c-44ba-942e-decbfd5bb32a', N'12345', 0, 0, NULL, 1, 0, N'Tania123', N'tania', N'emma', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'62acdb24-bf71-49ab-9f14-19cf2db32cf7', N'komal@gmail.com', 0, N'AJ/9BKsqfyrlXtJeglKgfoqEyuI4fpjvxZu7rsJ7Vx1VmZkk6UYguiUmLxeIKx8NPQ==', N'e638702a-a2c7-4e15-9405-e6b51fc2b4cc', N'543534', 0, 0, NULL, 1, 0, N'komal', N'komal', N'komal', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'6d16b3fd-4e52-4408-8d52-9ca8817b368c', N'taylor@gmail.com', 0, N'AHa7g/RO4S30IEqOxiKnLE0aP9zRkk6kdHvmlMELRDUajIMR1a+XWYE0Zcb3p7cH4g==', N'eb414f3c-a048-4606-af61-985f8c56c39c', N'123456', 0, 0, NULL, 1, 0, N'taylor123', N'taylar', N'john', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'70babb61-1c76-4d48-9777-471346176d0b', N'raise@gmail.com', 0, N'AFS5KmYSUeQRulFdfGDj+oyVW4LIMqBa56t3RplW6f0qJL+8ojMjAM/U8pYtrzoERA==', N'ad37a673-93b0-4e8c-92ed-169e3d6fccb9', N'12312434', 0, 0, NULL, 1, 0, N'raise', N'raise', N'raise', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'755ae934-6e74-4943-bb11-58ecd67f235a', N'user@gmail.com', 0, N'AHa7g/RO4S30IEqOxiKnLE0aP9zRkk6kdHvmlMELRDUajIMR1a+XWYE0Zcb3p7cH4g==', N'eb414f3c-a048-4606-af61-985f8c56c39c', NULL, 0, 0, NULL, 1, 0, N'user@gmail.com', N'User', N'test', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'7e8930f1-0fdc-4341-9db6-3cae7e784f57', N'virat@gmail.com', 0, N'AEpec8GI+CGPCILgi7NgQBCE2X0vKAz0UObTOsPAgGz7kMiBFOmXYHfiQfq0CBRjlA==', N'46e38f85-b498-46e9-a5da-49da092bf6ed', N'1244', 0, 0, NULL, 1, 0, N'virat', N'virat', N'virat', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'8921469f-d70d-4eb3-84c2-99da9a94b4ae', N'sahad@gmail.com', 0, N'AIv0LAk1rZF9NwOH+LVOWmJNGeq8qMvwUdYVHKTgkOZC997cY7BxXoeXD5ZbsEQ9bA==', N'53e04968-ae33-4769-897d-c60ab745549d', N'1242135', 0, 0, NULL, 1, 0, N'sahad', N'sahad', N'sahad', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb', N'benten@gmail.com', 0, N'AFSQ1zdnSt0ZaZG0M89I5seHuRBNhfi74rdfnmuOMoGopQqA5DQRWvYfB2hn6nqGbA==', N'0fc0d49e-7bb2-45b7-8139-aa3e7c8def79', N'1232141', 0, 0, NULL, 1, 0, N'benten', N'benten', N'benten', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'a0a96142-5dd2-4cff-a8a5-cfa85644fd09', N'roast@gmail', 0, N'AK4W/7Y+eDuP5w1VZBBp2usHNnSG2yJ45kr4XGVe+ZPCy9rHFMl9cOj4CFuhOBM2eQ==', N'40ed56ad-4d5e-48be-8542-bd9cafe335bb', N'132234354', 0, 0, NULL, 1, 0, N'roast12', N'roaster', N'roast', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'a3fc7977-ab5b-42da-b0f1-881f1bb9054c', N'morit@gmail.com', 0, N'AB27n69jXBu/zXws9xVXe1CjTG/BkPf/8ZquJ3kKsXYl5Ha+GIUi5u2TSfIO2CDeFw==', N'a001cb99-ac3b-4724-b8f3-aa9dcdcb8d29', N'2132144', 0, 0, NULL, 1, 0, N'morit', N'morit', N'morit', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'b7a048bb-e7f6-4055-81ae-cff2fab7afe1', N'roman@gmail.com', 0, N'AFqSiNX5l/droBhTxksxovapr9WJ/88p6NabYBNalnT0pmIJGXpUodLoUdiD71x99w==', N'31683633-d9b3-4a09-b46e-82415a1ead80', N'213214', 0, 0, NULL, 1, 0, N'roman', N'roman', N'roman', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'c2aeb231-0097-49d8-9c6e-855f054767ac', N'javed@gmail.com', 0, N'AOAPxsc79e6HbA6b0zxq/Yj2zzVSNmm7BO9X64ajqzA6z27db/FO2R+OPQ1ZR2tHYA==', N'b2eee7b2-bbd8-4b5b-9aa4-a20a83b1a01c', N'4532', 0, 0, NULL, 1, 0, N'javed', N'javed', N'javed', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'c3d5c1a1-fe41-4007-aee7-c35c1ae4e249', N'shamin@gmail.com', 0, N'AJzyWSBDP+yMmie9UwTCOiKkFa8yiclYnTz8A3m/6EPqyeInI6H7feBhOIzaTZaK/A==', N'96f1d1ce-dabd-4131-89cf-c9bdf3049946', N'123456', 0, 0, NULL, 1, 0, N'shamin', N'shamin', N'shamin', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'c7030748-a5f3-4b6e-8186-917509dcacf4', N'shami@gmail.com', 0, N'AIF4CPieqH9t3rnQeE5u9/YiP1FgHBlPhlkTflxalWh7VEvlojW1FX8cWKZnn+q8pQ==', N'd97a8c00-ba64-49c3-8f93-1cfd1a213b45', N'124124', 0, 0, NULL, 1, 0, N'shami', N'shami', N'shami', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'cb95f3e0-e4b3-4a46-a1dc-3dc624dc9d45', N'risel@gmail.com', 0, N'ANxQlYlU+Vzucfl87whfzVt7a5Ez2W0aAxAPC97bkR7jB3+wNTsXEPUL2TRnFBPqtQ==', N'a6038589-4c20-4b84-93f8-84aa2c1b1e98', N'124124124', 0, 0, NULL, 1, 0, N'risel', N'risel', N'risel', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'cc684418-8cf2-4d6c-b218-f90ee0e8a855', N'jorden@gmail.com', 0, N'AEmeoUT02Lbj4ALtU3TXQQJWynVNfQRRXEivM5Jhbbe77wgkAUtb0faqJTd8qUQqPQ==', N'e19b400d-db3e-4015-a4ac-dc2a866d0974', N'2467866', 0, 0, NULL, 1, 0, N'jorden', N'jorden', N'jorden', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'd0350c18-1374-40ec-81a9-c25305886aee', N'Tuser@gmail.com', 0, N'ALfwiNhizTrcv37lR+8kdBWUswb+PBTDBNEiUnXRo1ipUwZJlKcFF/xT7q0B3yZlkQ==', N'e6b9ec14-d24d-4623-82f6-0978d1ff103d', N'12345', 0, 0, NULL, 1, 0, N'Tuser', N'Tuser', N'Tuser', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'de24fe89-a4ce-42ba-b929-136f638e1f13', N'porting@gmail.com', 0, N'AGp8QlIkmUrZ9s2u84FZ6pyx8uveF9Wpyd/SEh1x49xStTmQFu/APlJuI3n7eHptfQ==', N'5d1288ad-a71d-49e4-9536-fcdafe4f80e2', N'12445454', 0, 0, NULL, 1, 0, N'porting', N'porting', N'porting', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'e0bd3004-92b9-429e-916c-dfaff817d9e6', N'suman@gmail.com', 0, N'AGRsu13y6QEEwktyHv2BE3MRMAXvJIVBen+1VQapdE8xXlNSlRP6yuHXhyLFLCRCEg==', N'11d269a1-deb4-4c56-a6b2-7bcbca69219f', N'42321', 0, 0, NULL, 1, 0, N'suman', N'suman', N'suman', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'e124bcb8-fa6d-48c4-b682-19f4d0ba4ecb', N'tahreem@gmail.com', 0, N'AMe3cqOtXwr/LJTb7hXt6y56baDrPi/jGe+1Rqbu3tIR7CXVn/DH9E0JnP6mi/iyKg==', N'714575b3-860b-4a07-8b88-9e10d5a378b9', N'21321412', 0, 0, NULL, 1, 0, N'tahreem', N'tahreem', N'tahreem', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'e6393661-524d-4c35-97a9-dacc909db40c', N'Rokey@gmail.com', 0, N'AOwMDIjz3wcllBqZwrav4sVfEiSHd4AWOUU+wJymvYvyl+9tgmUQdPgAnNtlYHZStQ==', N'6f4a42a6-d97e-46ee-a65e-fb9ca86d014d', N'1312434535', 0, 0, NULL, 1, 0, N'Rokey', N'Rokey', N'Rokey', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'e899aa9a-f87f-4634-bfcc-0bb4c1e554f4', N'huma@gmail.com', 0, N'ABZ/EK2KQ9mvvQHWUoPT5AVXPnvfmG5k0mAfESx9lGKHvhCUwCrv1R2iOYeWqrw98A==', N'8e5fdbb5-8f0e-4968-82c5-507da61ffb07', N'1244', 0, 0, NULL, 1, 0, N'huma', N'huma', N'huma', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'f303753e-4840-49f5-ab1a-b3d8e516db72', N'suban@gmail.com', 0, N'ADXxDboYVPvmJ30vqji41mLXrsO2rbjxlXS4IczJG+nJzzJNZLKOCf15Y4jAjAJ04A==', N'bfe66723-a1c4-4542-b136-bce33f552805', N'1245325', 0, 0, NULL, 1, 0, N'suban', N'suban', N'suban', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'f5b0802d-f5cd-4c61-9b74-6b13878fb800', N'jiya@gmail.com', 0, N'AP6oMw51SKqCFjFdpNgRneRMuXiSAp7VS1XOqb218BVIxd+NIlfmi+QNUoZyP7Elgw==', N'493d5e15-fcc4-4a31-8687-88a00a9844ff', N'13243567', 0, 0, NULL, 1, 0, N'jiya', N'jiya', N'jiya', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Image]) VALUES (N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'john@gmail.com', 0, N'ADaTPc/lVdULufyFrUxYGHQFrwjqJhDI8MTNMJYWTnkV8DR8iE7InTcM3XlDNxS8Og==', N'e31f479a-4c1e-4062-aaa2-dcfc7aedd1a3', N'1234567', 0, 0, NULL, 1, 0, N'john', N'john', N'john', N'/Content/UploadProfile/johnavatar.jpg')
SET IDENTITY_INSERT [dbo].[Board] ON 

INSERT [dbo].[Board] ([Id], [Name], [BoardValueId], [Isexpired], [Number]) VALUES (81, N'B', 1, 1, 0)
INSERT [dbo].[Board] ([Id], [Name], [BoardValueId], [Isexpired], [Number]) VALUES (82, N'BT', 2, 0, 0)
INSERT [dbo].[Board] ([Id], [Name], [BoardValueId], [Isexpired], [Number]) VALUES (83, N'B', 1, 0, 1)
INSERT [dbo].[Board] ([Id], [Name], [BoardValueId], [Isexpired], [Number]) VALUES (84, N'B', 1, 0, 2)
INSERT [dbo].[Board] ([Id], [Name], [BoardValueId], [Isexpired], [Number]) VALUES (85, N'B', 1, 0, 3)
INSERT [dbo].[Board] ([Id], [Name], [BoardValueId], [Isexpired], [Number]) VALUES (86, N'B', 1, 0, 4)
SET IDENTITY_INSERT [dbo].[Board] OFF
SET IDENTITY_INSERT [dbo].[BoardValue] ON 

INSERT [dbo].[BoardValue] ([Id], [Value]) VALUES (1, N'$100')
INSERT [dbo].[BoardValue] ([Id], [Value]) VALUES (2, N'$1000')
SET IDENTITY_INSERT [dbo].[BoardValue] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (398, N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb', 81, 0, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (399, N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f', 81, 0, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (400, N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', 82, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (401, N'15a85b9b-a4a4-44d0-a6e1-9dd71d955904', 82, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (402, N'0c50dc80-b150-48f9-a957-660b7fd67d07', 81, 0, 0, N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (403, N'1212b9ff-7d49-446b-9d9b-0ebe19029623', 81, 0, 0, N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (404, N'1c86eb71-f0dd-47ef-b6a6-42d03348c312', 81, 0, 0, N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (405, N'2aaf01f3-8602-480d-a060-f3e1271463b6', 81, 0, 0, N'92b0e88c-8cdd-4e9f-a785-289759f0bdbb')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (406, N'3811ac89-161d-4469-b9cd-9141f8ea06cf', 81, 0, 0, N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (407, N'3863aa8b-2ca7-48d5-bee1-61877930e042', 81, 0, 0, N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (408, N'3d59f254-eaea-48d6-908f-74d83740e9bd', 81, 0, 0, N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (409, N'4e574a22-a8f2-4bf0-9f78-d6bff8f85dd7', 81, 0, 0, N'570c56ff-7ddd-48af-9cab-c4aa1bb9f84f')
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (410, N'0c50dc80-b150-48f9-a957-660b7fd67d07', 83, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (411, N'1212b9ff-7d49-446b-9d9b-0ebe19029623', 83, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (412, N'1c86eb71-f0dd-47ef-b6a6-42d03348c312', 84, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (413, N'2aaf01f3-8602-480d-a060-f3e1271463b6', 84, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (414, N'3811ac89-161d-4469-b9cd-9141f8ea06cf', 85, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (415, N'3863aa8b-2ca7-48d5-bee1-61877930e042', 85, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (416, N'3d59f254-eaea-48d6-908f-74d83740e9bd', 86, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [memberId], [BoardId], [IsActive], [isCoremember], [corememberId]) VALUES (417, N'4e574a22-a8f2-4bf0-9f78-d6bff8f85dd7', 86, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[tbl_Conversation] ON 

INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (49, N'hii', N'09:43 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (50, N'hh', N'09:44 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (51, N'gg', N'09:43 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (52, N'hghg', N'10:04 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (53, N'k', N'10:04 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (54, N'j', N'10:08 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (55, N'hjghjg', N'10:09 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (56, N'hjhg', N'10:10 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (57, N'hello', N'10:13 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (58, N'hello', N'10:15 AM | Jan 14', N'1212b9ff-7d49-446b-9d9b-0ebe19029623', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (59, N'yee', N'10:27 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (60, N'hee', N'10:27 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (61, N'kdr', N'10:29 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (62, N'ff', N'10:27 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (63, N'gar', N'10:29 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (64, N'kdr', N'10:29 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (65, N'ss', N'10:29 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (66, N'sds', N'10:32 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (67, N'hello', N'10:33 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (68, N'yes', N'10:33 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (69, N'kk', N'10:33 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (70, N'gg', N'10:33 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (71, N'zari ly', N'10:33 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (72, N'che zar yrr', N'10:33 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (73, N'hello', N'10:40 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (74, N'kia hal hy', N'10:40 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (75, N'thk hun', N'10:40 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (76, N'hii ', N'10:59 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (77, N'yes', N'10:59 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (78, N'jj', N'10:59 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (79, N'jj', N'11:09 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (80, N'ff', N'11:09 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (81, N'hii', N'11:12 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (82, N'hii', N'11:49 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (83, N'yess', N'11:49 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (84, N'gg', N'11:49 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (85, N'jj', N'11:49 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (86, N'hii', N'11:50 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (87, N'asda', N'11:51 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (88, N'yess', N'11:50 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (89, N'yess', N'11:53 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (90, N'hh', N'11:53 AM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (91, N'hjh', N'11:49 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (92, N'yess', N'11:53 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (93, N'hll', N'11:53 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (94, N'kk', N'11:53 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (95, N'jj', N'11:53 AM | Jan 14', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (96, N'sds', N'12:03 PM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (97, N'jj', N'12:05 PM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'4a5b6cce-117d-4eac-a9f8-6d50843c0c9b')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (98, N'hii', N'12:05 PM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (99, N'yes', N'11:49 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (100, N'hello admin', N'12:04 PM | Jan 14', N'6d16b3fd-4e52-4408-8d52-9ca8817b368c', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (101, N'ghgh', N'12:05 PM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (102, N'hggh', N'11:49 AM | Jan 14', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878')
INSERT [dbo].[tbl_Conversation] ([ID], [Msg], [MsgDate], [SenderID], [ReceiverID]) VALUES (103, N'jj', N'01:00 PM | Jan 14', N'0b6d4569-de2c-4633-ba9d-8df0f81b2878', N'fb2508c9-b4b4-4bd3-a8ec-41acfd47978e')
SET IDENTITY_INSERT [dbo].[tbl_Conversation] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Board]  WITH CHECK ADD  CONSTRAINT [FK_Board_BoardValue] FOREIGN KEY([BoardValueId])
REFERENCES [dbo].[BoardValue] ([Id])
GO
ALTER TABLE [dbo].[Board] CHECK CONSTRAINT [FK_Board_BoardValue]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_AspNetUsers1] FOREIGN KEY([memberId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_AspNetUsers1]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Board] FOREIGN KEY([BoardId])
REFERENCES [dbo].[Board] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Board]
GO
ALTER TABLE [dbo].[tbl_Conversation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Conversation_AspNetUsers] FOREIGN KEY([SenderID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tbl_Conversation] CHECK CONSTRAINT [FK_tbl_Conversation_AspNetUsers]
GO
ALTER TABLE [dbo].[tbl_Conversation]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Conversation_AspNetUsers1] FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[tbl_Conversation] CHECK CONSTRAINT [FK_tbl_Conversation_AspNetUsers1]
GO
