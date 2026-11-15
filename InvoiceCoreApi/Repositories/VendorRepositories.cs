using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Contracts;
using InvoiceCoreAPI.Data;
using InvoiceCoreAPI.DTO;
using InvoiceCoreAPI.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace InvoiceCoreAPI.Repositories;

public class VendorRepositories : IVendorRepository
{
    private readonly AppDbContext _dbContext;

    public VendorRepositories(AppDbContext dbContext)
    {
        _dbContext = dbContext;
    }

    public async Task<int> AddAsync(Vendor vendor)
    {
        var result = await _dbContext.Database.ExecuteSqlRawAsync(
            @"EXEC sp_Vendor_Insert
                @VendorCode,
                @VendorName,
                @ContactPerson,
                @MobileNo,
                @Email,
                @Address1,
                @Address2,
                @City,
                @State,
                @Country,
                @ZipCode,
                @GstNo,
                @IsActive",

            new SqlParameter("@VendorCode", vendor.VendorCode),
            new SqlParameter("@VendorName", vendor.VendorName),
            new SqlParameter("@ContactPerson", (object?)vendor.ContactPerson ?? DBNull.Value),
            new SqlParameter("@MobileNo", (object?)vendor.MobileNo ?? DBNull.Value),
            new SqlParameter("@Email", (object?)vendor.Email ?? DBNull.Value),
            new SqlParameter("@Address1", (object?)vendor.Address1 ?? DBNull.Value),
            new SqlParameter("@Address2", (object?)vendor.Address2 ?? DBNull.Value),
            new SqlParameter("@City", (object?)vendor.City ?? DBNull.Value),
            new SqlParameter("@State", (object?)vendor.State ?? DBNull.Value),
            new SqlParameter("@Country", (object?)vendor.Country ?? DBNull.Value),
            new SqlParameter("@ZipCode", (object?)vendor.ZipCode ?? DBNull.Value),
            new SqlParameter("@GstNo", (object?)vendor.GstNo ?? DBNull.Value),
            new SqlParameter("@IsActive", vendor.IsActive)
        );

        return result;
    }


    public async Task<bool> UpdateAsync(Vendor vendor)
    {
        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(
            @"EXEC dbo.sp_Vendor_Update
            @Id,
            @VendorCode,
            @VendorName,
            @ContactPerson,
            @MobileNo,
            @Email,
            @Address1,
            @Address2,
            @City,
            @State,
            @Country,
            @ZipCode,
            @GstNo,
            @IsActive,
            @IsDeleted",

            new SqlParameter("@Id", vendor.Id),
            new SqlParameter("@VendorCode", SqlDbType.VarChar, 20)
            {
                Value = vendor.VendorCode
            },
            new SqlParameter("@VendorName", SqlDbType.NVarChar, 100)
            {
                Value = vendor.VendorName
            },
            new SqlParameter("@ContactPerson", SqlDbType.NVarChar, 100)
            {
                Value = (object?)vendor.ContactPerson ?? DBNull.Value
            },
            new SqlParameter("@MobileNo", SqlDbType.VarChar, 20)
            {
                Value = (object?)vendor.MobileNo ?? DBNull.Value
            },
            new SqlParameter("@Email", SqlDbType.VarChar, 100)
            {
                Value = (object?)vendor.Email ?? DBNull.Value
            },
            new SqlParameter("@Address1", SqlDbType.NVarChar, 200)
            {
                Value = (object?)vendor.Address1 ?? DBNull.Value
            },
            new SqlParameter("@Address2", SqlDbType.NVarChar, 200)
            {
                Value = (object?)vendor.Address2 ?? DBNull.Value
            },
            new SqlParameter("@City", SqlDbType.NVarChar, 100)
            {
                Value = (object?)vendor.City ?? DBNull.Value
            },
            new SqlParameter("@State", SqlDbType.NVarChar, 100)
            {
                Value = (object?)vendor.State ?? DBNull.Value
            },
            new SqlParameter("@Country", SqlDbType.NVarChar, 100)
            {
                Value = (object?)vendor.Country ?? DBNull.Value
            },
            new SqlParameter("@ZipCode", SqlDbType.VarChar, 20)
            {
                Value = (object?)vendor.ZipCode ?? DBNull.Value
            },
            new SqlParameter("@GstNo", SqlDbType.VarChar, 50)
            {
                Value = (object?)vendor.GstNo ?? DBNull.Value
            },
            new SqlParameter("@IsActive", SqlDbType.Bit)
            {
                Value = vendor.IsActive
            },
            new SqlParameter("@IsDeleted", SqlDbType.Bit)
            {
                Value = vendor.IsDeleted
            }
        );

        return affectedRows > 0;
    }

    public async Task<Vendor?> GetByIdAsync(int id)
    {
        var items = await _dbContext.Vendor
            .FromSqlRaw("EXEC sp_Vendor_GetById @Id",
                new SqlParameter("@Id", id))
            .AsNoTracking()
            .ToListAsync();

        return items.FirstOrDefault();
    }

    public async Task<IEnumerable<Vendor>> GetAllAsync()
    {
        return await _dbContext.Vendor
            .FromSqlRaw("EXEC sp_Vendor_GetAll")
            .ToListAsync();
    }

    public async Task<bool> DeleteAsync(int id)
    {
        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(
            "EXEC sp_Vendor_Delete @Id",
            new SqlParameter("@Id", id));

        return affectedRows > 0;
    }

    public async Task<PagedResultDto<Vendor>> GetAllPagedAsync(
        string? VendorCode,
        string? VendorName,
        string? ContactPerson,
        string? MobileNo,
        string? Email,
        string? City,
        bool? IsActive,
        int pageNumber,
        int pageSize)
    {
        using var connection = _dbContext.Database.GetDbConnection();

        await connection.OpenAsync();

        using var command = connection.CreateCommand();

        command.CommandText = "sp_Vendor_GetPaged";
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add(new SqlParameter("@VendorCode", (object?)VendorCode ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@VendorName", (object?)VendorName ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@ContactPerson", (object?)ContactPerson ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@MobileNo", (object?)MobileNo ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@Email", (object?)Email ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@City", (object?)City ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@IsActive", (object?)IsActive ?? DBNull.Value));
        command.Parameters.Add(new SqlParameter("@PageNumber", pageNumber));
        command.Parameters.Add(new SqlParameter("@PageSize", pageSize));

        using var reader = await command.ExecuteReaderAsync();

        var items = new List<Vendor>();

        while (await reader.ReadAsync())
        {
            items.Add(new Vendor
            {
                Id = reader.GetInt32(0),
                VendorCode = reader.GetString(1),
                VendorName = reader.GetString(2),
                ContactPerson = reader.IsDBNull(3) ? null : reader.GetString(3),
                MobileNo = reader.IsDBNull(4) ? null : reader.GetString(4),
                Email = reader.IsDBNull(5) ? null : reader.GetString(5),
                Address1 = reader.IsDBNull(6) ? null : reader.GetString(6),
                Address2 = reader.IsDBNull(7) ? null : reader.GetString(7),
                City = reader.IsDBNull(8) ? null : reader.GetString(8),
                State = reader.IsDBNull(9) ? null : reader.GetString(9),
                Country = reader.IsDBNull(10) ? null : reader.GetString(10),
                ZipCode = reader.IsDBNull(11) ? null : reader.GetString(11),
                GstNo = reader.IsDBNull(12) ? null : reader.GetString(12),
                IsActive = reader.GetBoolean(13),
                IsDeleted = reader.GetBoolean(14),
                CreatedBy = reader.IsDBNull(15) ? null : reader.GetString(15),
                CreatedDate = reader.GetDateTime(16),
                UpdatedBy = reader.IsDBNull(17) ? null : reader.GetString(17),
                UpdatedDate = reader.IsDBNull(18) ? null : reader.GetDateTime(18)
            });
        }

        await reader.NextResultAsync();

        int totalRecords = 0;

        if (await reader.ReadAsync())
        {
            totalRecords = reader.GetInt32(0);
        }

        return new PagedResultDto<Vendor>
        {
            Data = items,
            TotalRecords = totalRecords
        };
    }
}