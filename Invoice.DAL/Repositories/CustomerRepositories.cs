using Invoice.Data.Db;
using Invoice.Data.Entities;
using Invoice.DTOs;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.DAL.Repositories
{
    public class CustomerRepositories : ICustomerRepository



    {

        private readonly AppDbContext _dbContext;

        public CustomerRepositories(AppDbContext dbContext)

        {

            _dbContext = dbContext;

        }

        public async Task<int> AddAsync(CustomerEntity entity)
        {
            var result = await _dbContext.Database.ExecuteSqlRawAsync(
                @"EXEC sp_Customer_Insert
        @CustomerCode,
        @CustomerName,
        @ContactPerson,
        @MobileNo,
        @Email,
        @Address1,
        @Address2,
        @City,
        @State,
        @Country,
        @ZipCode,
        @GstNo",

                new SqlParameter("@CustomerCode", entity.CustomerCode),
                new SqlParameter("@CustomerName", entity.CustomerName),
                new SqlParameter("@ContactPerson", (object?)entity.ContactPerson ?? DBNull.Value),
                new SqlParameter("@MobileNo", (object?)entity.MobileNo ?? DBNull.Value),
                new SqlParameter("@Email", (object?)entity.Email ?? DBNull.Value),
                new SqlParameter("@Address1", (object?)entity.Address1 ?? DBNull.Value),
                new SqlParameter("@Address2", (object?)entity.Address2 ?? DBNull.Value),
                new SqlParameter("@City", (object?)entity.City ?? DBNull.Value),
                new SqlParameter("@State", (object?)entity.State ?? DBNull.Value),
                new SqlParameter("@Country", (object?)entity.Country ?? DBNull.Value),
                new SqlParameter("@ZipCode", (object?)entity.ZipCode ?? DBNull.Value),
                new SqlParameter("@GstNo", (object?)entity.GstNo ?? DBNull.Value)
            );

            return result;
        }

        public async Task<bool> UpdateAsync(CustomerEntity entity)
        {
            await _dbContext.Database.ExecuteSqlRawAsync(
                @"EXEC sp_Customer_Update
        @Id,
        @CustomerCode,
        @CustomerName,
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
        @IsDeleted,
        @IsActive",

                new SqlParameter("@Id", entity.Id),
                new SqlParameter("@CustomerCode", entity.CustomerCode),
                new SqlParameter("@CustomerName", entity.CustomerName),
                new SqlParameter("@ContactPerson", (object?)entity.ContactPerson ?? DBNull.Value),
                new SqlParameter("@MobileNo", (object?)entity.MobileNo ?? DBNull.Value),
                new SqlParameter("@Email", (object?)entity.Email ?? DBNull.Value),
                new SqlParameter("@Address1", (object?)entity.Address1 ?? DBNull.Value),
                new SqlParameter("@Address2", (object?)entity.Address2 ?? DBNull.Value),
                new SqlParameter("@City", (object?)entity.City ?? DBNull.Value),
                new SqlParameter("@State", (object?)entity.State ?? DBNull.Value),
                new SqlParameter("@Country", (object?)entity.Country ?? DBNull.Value),
                new SqlParameter("@ZipCode", (object?)entity.ZipCode ?? DBNull.Value),
                new SqlParameter("@GstNo", (object?)entity.GstNo ?? DBNull.Value),
                new SqlParameter("IsDeleted",entity.IsDeleted),
                new SqlParameter("@IsActive", entity.IsActive)
            );

            return true;
        }
        public async Task<CustomerEntity?> GetByIdAsync(int id)

        {


            var items = await _dbContext.Customers

                .FromSqlRaw("EXEC sp_Customer_GetById @Id",

                new SqlParameter("@Id", id))

                .AsNoTracking()

                .ToListAsync();

            return items.FirstOrDefault();

        }

        public async Task<IEnumerable<CustomerEntity>> GetAllAsync()

        {

            return await _dbContext.Customers

                .FromSqlRaw("EXEC sp_Customer_GetAll")

                .ToListAsync();

        }

        public async Task<bool> DeleteAsync(int id)

        {

            var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(

                "EXEC sp_Customer_Delete @Id",

                new SqlParameter("@Id", id));

            return affectedRows > 0;

        }

        public async Task<PagedResultDto<CustomerEntity>> GetAllPagedAsync(

    string? CustomeCode,

    string? CustomeName,
    string? MobileNo,

    string? City,
   

    int pageNumber,

    int pageSize)


        {


            using (var connection = _dbContext.Database.GetDbConnection())

            {

                await connection.OpenAsync();

                using var command = connection.CreateCommand();

                command.CommandText = "sp_Customer_GetPaged";

                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CustomerCode", (object?)CustomeCode ?? DBNull.Value));

                command.Parameters.Add(new SqlParameter("@CustomerName", (object?)CustomeName ?? DBNull.Value));

               command.Parameters.Add(new SqlParameter("@MobileNo",(Object?)MobileNo?? DBNull.Value));

               command.Parameters.Add(new SqlParameter("@City",(Object?)City ?? DBNull.Value));

                command.Parameters.Add(new SqlParameter("@PageNumber", pageNumber));

                command.Parameters.Add(new SqlParameter("@PageSize", pageSize));

                using var reader = await command.ExecuteReaderAsync();

                var items = new List<CustomerEntity>();

                while (await reader.ReadAsync())

                {

                    items.Add(new CustomerEntity
                    {
                        Id = reader.GetInt32(0),
                        CustomerCode = reader.GetString(1),
                        CustomerName = reader.GetString(2),
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

                return new PagedResultDto<CustomerEntity>

                {

                    Data = items,

                    TotalRecords = totalRecords

                };


            }

        }


        public async Task<int> GetCustomerCountAsync(bool? activeOnly)

        {

            var query = _dbContext.Customers

                .Where(x => x.IsDeleted != true);

            if (activeOnly.HasValue)

            {

                query = query.Where(x =>

                    x.IsActive == activeOnly.Value);

            }

            return await query.CountAsync();

        }
    }
}


    
