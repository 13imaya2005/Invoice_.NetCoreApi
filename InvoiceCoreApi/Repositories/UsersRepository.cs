using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Contracts;
using InvoiceCoreAPI.Data;
using InvoiceCoreAPI.DTO;
using InvoiceCoreAPI.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace InvoiceCoreAPI.Repositories;

public class UsersRepositories : IUsersRepository

{

    private readonly AppDbContext _dbContext;

    public UsersRepositories(AppDbContext dbContext)

    {

        _dbContext = dbContext;

    }

    public async Task<int> AddAsync(Users users)

    {

        var result = await _dbContext.Database.ExecuteSqlRawAsync(

            @"EXEC sp_Users_Insert
 
            @UserName,
 
            @Email,
 
            @Password,
 
            @FirstName,
 
            @MiddleName,
 
            @LastName,
 
            @DisplayName,
 
            @PhoneNumber,
 
            @AlternatePhone,
 
            @AddressLine1,
 
            @AddressLine2,
 
            @City,
 
            @State,
 
            @ZipCode,
 
            @Country,
 
            @DateOfBirth",

            new SqlParameter("@UserName", users.UserName),

            new SqlParameter("@Email", users.Email),

            new SqlParameter("@Password", users.Password),

            new SqlParameter("@FirstName", users.FirstName),

            new SqlParameter("@MiddleName", (object?)users.MiddleName ?? DBNull.Value),

            new SqlParameter("@LastName", users.LastName),

            new SqlParameter("@DisplayName", users.DisplayName),

            new SqlParameter("@PhoneNumber", users.PhoneNumber),

            new SqlParameter("@AlternatePhone", (object?)users.AlternatePhone ?? DBNull.Value),

            new SqlParameter("@AddressLine1", users.AddressLine1),

            new SqlParameter("@AddressLine2", (object?)users.AddressLine2 ?? DBNull.Value),

            new SqlParameter("@City", users.City),

            new SqlParameter("@State", users.State),

            new SqlParameter("@ZipCode", users.ZipCode),

            new SqlParameter("@Country", users.Country),

            new SqlParameter("@DateOfBirth", (object?)users.DateOfBirth ?? DBNull.Value)

            );

        return result;

    }

    public async Task<bool> UpdateAsync(Users users)

    {

        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync

            (

            @"EXEC sp_Users_Update
 
        @Id,
 
        @UserName,
 
        @Email,
 
        @Password,
 
        @FirstName,
 
        @MiddleName,
 
        @LastName,
 
        @DisplayName,
 
        @PhoneNumber,
 
        @AlternatePhone,
 
        @AddressLine1,
 
        @AddressLine2,
 
        @City,
 
        @State,
 
        @ZipCode,
 
        @Country,
 
        @DateOfBirth",

            new SqlParameter("@Id", users.Id),

            new SqlParameter("@UserName", users.UserName),

            new SqlParameter("@Email", users.Email),

            new SqlParameter("@Password", users.Password),

            new SqlParameter("@FirstName", users.FirstName),

            new SqlParameter("@MiddleName", (object?)users.MiddleName ?? DBNull.Value),

            new SqlParameter("@LastName", users.LastName),

            new SqlParameter("@DisplayName", users.DisplayName),

            new SqlParameter("@PhoneNumber", users.PhoneNumber),

            new SqlParameter("@AlternatePhone", (object?)users.AlternatePhone ?? DBNull.Value),

            new SqlParameter("@AddressLine1", users.AddressLine1),

            new SqlParameter("@AddressLine2", (object?)users.AddressLine2 ?? DBNull.Value),

            new SqlParameter("@City", users.City),

            new SqlParameter("@State", users.State),

            new SqlParameter("@ZipCode", users.ZipCode),

            new SqlParameter("@Country", users.Country),

            new SqlParameter("@DateOfBirth", (object?)users.DateOfBirth ?? DBNull.Value)

            );

        return affectedRows > 0;

    }

    public async Task<Users?> GetByIdAsync(int id)

    {

        var users = await _dbContext.Users

            .FromSqlRaw("EXEC sp_Users_GetById @Id",

            new SqlParameter("@Id", id))

            .AsNoTracking()

            .ToListAsync();

        return users.FirstOrDefault();

    }

    public async Task<IEnumerable<Users>> GetAllAsync()

    {

        return await _dbContext.Users

            .FromSqlRaw("EXEC sp_Users_GetAll")

            .ToListAsync();

    }

    public async Task<bool> DeleteAsync(int id)

    {

        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync

            (

            "EXEC sp_Users_Delete @Id",

            new SqlParameter("@Id", id)

            );

        return affectedRows > 0;

    }

    public async Task<PagedResultDto<Users>> GetAllPagedAsync(

        string? UserName,

        string? FirstName,

        string? LastName,

        string? PhoneNumber,

        string? City,

        DateTime? DateOfBirth,

        bool? IsActive,

        int PageNumber,

        int PageSize

        )

    {

        using (var connection = _dbContext.Database.GetDbConnection())

        {

            await connection.OpenAsync();

            using var command = connection.CreateCommand();

            command.CommandText = "sp_Users_GetPaged";

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@UserName", (object?)UserName ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@FirstName", (object?)FirstName ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@LastName", (object?)LastName ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@PhoneNumber", (object?)PhoneNumber ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@City", (object?)City ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@DateOfBirth", (object?)DateOfBirth ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@IsActive", (object?)IsActive ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@PageNumber", PageNumber));

            command.Parameters.Add(new SqlParameter("@PageSize", PageSize));

            using var reader = await command.ExecuteReaderAsync();

            var users = new List<Users>();

            while (await reader.ReadAsync())

            {

                users.Add(new Users

                {

                    Id = reader.GetInt32(0),

                    UserName = reader.IsDBNull(1) ? "" : reader.GetString(1),

                    Email = reader.IsDBNull(2) ? "" : reader.GetString(2),

                    Password = reader.IsDBNull(3) ? "" : reader.GetString(3),

                    FirstName = reader.IsDBNull(4) ? "" : reader.GetString(4),

                    MiddleName = reader.IsDBNull(5) ? null : reader.GetString(5),

                    LastName = reader.IsDBNull(6) ? "" : reader.GetString(6),

                    DisplayName = reader.GetString(7),

                    PhoneNumber = reader.GetString(8),

                    AlternatePhone = reader.IsDBNull(9) ? null : reader.GetString(9),

                    AddressLine1 = reader.GetString(10),

                    AddressLine2 = reader.IsDBNull(11) ? null : reader.GetString(11),

                    City = reader.GetString(12),

                    State = reader.GetString(13),

                    ZipCode = reader.GetString(14),

                    Country = reader.GetString(15),

                    DateOfBirth = reader.IsDBNull(16) ? null : reader.GetDateTime(16),


                });

            }

            await reader.NextResultAsync();

            int totalRecords = 0;

            if (await reader.ReadAsync())

            {

                totalRecords = reader.GetInt32(0);

            }

            return new PagedResultDto<Users>

            {

                Data = users,

                TotalRecords = totalRecords

            };

        }

    }

}

