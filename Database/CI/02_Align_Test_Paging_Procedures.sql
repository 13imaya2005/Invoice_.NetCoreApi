USE [Invoice_Test];
GO

CREATE OR ALTER PROCEDURE dbo.sp_Customer_GetPaged
	@CustomerCode VARCHAR(20) = NULL,
	@CustomerName VARCHAR(100) = NULL,
	@MobileNo NVARCHAR(20) = NULL,
	@City NVARCHAR(100) = NULL,
	@IsActive BIT = NULL,
	@PageNumber INT = 1,
	@PageSize INT = 10
AS
BEGIN
	SET NOCOUNT ON;

	IF @PageNumber <= 0 SET @PageNumber = 1;
	IF @PageSize <= 0 SET @PageSize = 10;

	DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;

	SELECT Id, CustomerCode, CustomerName, ContactPerson, MobileNo, Email,
		   Address1, Address2, City, State, Country, ZipCode, GstNo,
		   IsActive, IsDeleted, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
	FROM dbo.Customer
	WHERE (@CustomerCode IS NULL OR CustomerCode LIKE '%' + @CustomerCode + '%')
	  AND (@CustomerName IS NULL OR CustomerName LIKE '%' + @CustomerName + '%')
	  AND (@MobileNo IS NULL OR MobileNo LIKE '%' + @MobileNo + '%')
	  AND (@City IS NULL OR City LIKE '%' + @City + '%')
	  AND (@IsActive IS NULL OR IsActive = @IsActive)
	ORDER BY Id ASC
	OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY;

	SELECT COUNT(1) AS TotalRecords
	FROM dbo.Customer
	WHERE (@CustomerCode IS NULL OR CustomerCode LIKE '%' + @CustomerCode + '%')
	  AND (@CustomerName IS NULL OR CustomerName LIKE '%' + @CustomerName + '%')
	  AND (@MobileNo IS NULL OR MobileNo LIKE '%' + @MobileNo + '%')
	  AND (@City IS NULL OR City LIKE '%' + @City + '%')
	  AND (@IsActive IS NULL OR IsActive = @IsActive);
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Customer_Update
	@Id INT,
	@CustomerCode VARCHAR(20),
	@CustomerName NVARCHAR(100),
	@ContactPerson NVARCHAR(100) = NULL,
	@MobileNo VARCHAR(20) = NULL,
	@Email VARCHAR(100) = NULL,
	@Address1 NVARCHAR(200) = NULL,
	@Address2 NVARCHAR(200) = NULL,
	@City NVARCHAR(100) = NULL,
	@State NVARCHAR(100) = NULL,
	@Country NVARCHAR(100) = NULL,
	@ZipCode VARCHAR(20) = NULL,
	@GstNo VARCHAR(50) = NULL,
	@IsActive BIT,
	@IsDeleted BIT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Customer
	SET CustomerCode = @CustomerCode,
		CustomerName = @CustomerName,
		ContactPerson = @ContactPerson,
		MobileNo = @MobileNo,
		Email = @Email,
		Address1 = @Address1,
		Address2 = @Address2,
		City = @City,
		State = @State,
		Country = @Country,
		ZipCode = @ZipCode,
		GstNo = @GstNo,
		IsActive = @IsActive,
		IsDeleted = @IsDeleted,
		UpdatedBy = SYSTEM_USER,
		UpdatedDate = GETDATE()
	WHERE Id = @Id;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Vendor_GetPaged
	@VendorCode VARCHAR(20) = NULL,
	@VendorName VARCHAR(100) = NULL,
	@MobileNo NVARCHAR(20) = NULL,
	@City NVARCHAR(100) = NULL,
	@IsActive BIT = NULL,
	@PageNumber INT = 1,
	@PageSize INT = 10
AS
BEGIN
	SET NOCOUNT ON;

	IF @PageNumber <= 0 SET @PageNumber = 1;
	IF @PageSize <= 0 SET @PageSize = 10;

	DECLARE @Offset INT = (@PageNumber - 1) * @PageSize;

	SELECT Id, VendorCode, VendorName, ContactPerson, MobileNo, Email,
		   Address1, Address2, City, State, Country, ZipCode, GstNo,
		   IsActive, IsDeleted, CreatedBy, CreatedDate, UpdatedBy, UpdatedDate
	FROM dbo.Vendor
	WHERE (@VendorCode IS NULL OR VendorCode LIKE '%' + @VendorCode + '%')
	  AND (@VendorName IS NULL OR VendorName LIKE '%' + @VendorName + '%')
	  AND (@MobileNo IS NULL OR MobileNo LIKE '%' + @MobileNo + '%')
	  AND (@City IS NULL OR City LIKE '%' + @City + '%')
	  AND (@IsActive IS NULL OR IsActive = @IsActive)
	ORDER BY Id ASC
	OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY;

	SELECT COUNT(1) AS TotalRecords
	FROM dbo.Vendor
	WHERE (@VendorCode IS NULL OR VendorCode LIKE '%' + @VendorCode + '%')
	  AND (@VendorName IS NULL OR VendorName LIKE '%' + @VendorName + '%')
	  AND (@MobileNo IS NULL OR MobileNo LIKE '%' + @MobileNo + '%')
	  AND (@City IS NULL OR City LIKE '%' + @City + '%')
	  AND (@IsActive IS NULL OR IsActive = @IsActive);
END;
GO
