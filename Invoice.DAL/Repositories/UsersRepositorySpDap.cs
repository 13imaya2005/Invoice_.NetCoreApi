using Invoice.DAL.Contracts;
using Invoice.Data.Entities;
using Invoice.DTOs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace Invoice.DAL.Repositories
{
    public class UsersRepositorySpDap : IUsersRepository
    {
        private readonly IDbConnection _connection;

        public UsersRepositorySpDap(IDbConnection connection)
        {
            _connection = connection;
        }

        public async Task<IEnumerable<UsersEntity>> GetAllAsync()
        {
            return await _connection.QueryAsync<UsersEntity>(
                "dbo.sp_User_GetAll",
                commandType: CommandType.StoredProcedure);
        }

        public async Task<UsersEntity?> GetByIdAsync(int id)
        {
            return await _connection.QueryFirstOrDefaultAsync<UsersEntity>(
                "dbo.sp_User_GetById",
                new
                {
                    Id = id
                },
                commandType: CommandType.StoredProcedure);
        }

        public async Task<UsersEntity?> GetByUserNameAsync(
            string userName)
        {
            return await _connection.QueryFirstOrDefaultAsync<UsersEntity>(
                "dbo.sp_User_GetByUserName",
                new
                {
                    UserName = userName
                },
                commandType: CommandType.StoredProcedure);
        }

        public async Task<UsersEntity?> GetByEmailAsync(
            string email)
        {
            return await _connection.QueryFirstOrDefaultAsync<UsersEntity>(
                "dbo.sp_User_GetByEmail",
                new
                {
                    Email = email
                },
                commandType: CommandType.StoredProcedure);
        }

        public async Task<int> AddAsync(UsersEntity entity)
        {
            var parameters = new
            {
                entity.UserName,
                entity.Email,
                entity.PasswordHash,
                entity.FirstName,
                entity.MiddleName,
                entity.LastName,
                entity.DisplayName,
                entity.PhoneNumber,
                entity.AlternatePhone,
                entity.AddressLine1,
                entity.AddressLine2,
                entity.City,
                entity.State,
                entity.ZipCode,
                entity.Country,
                entity.DateOfBirth,
                entity.IsActive,
                entity.CreatedBy
            };

            return await _connection.ExecuteScalarAsync<int>(
                "dbo.sp_User_Insert",
                parameters,
                commandType: CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(
            int id,
            UsersEntity user)
        {
            var parameters = new DynamicParameters();

            parameters.Add("Id", id);
            parameters.Add("UserName", user.UserName);
            parameters.Add("Email", user.Email);
            // parameters.Add("PasswordHash", user.PasswordHash);
            parameters.Add("FirstName", user.FirstName);
            parameters.Add("MiddleName", user.MiddleName);
            parameters.Add("LastName", user.LastName);
            parameters.Add("DisplayName", user.DisplayName);
            parameters.Add("PhoneNumber", user.PhoneNumber);
            parameters.Add("AlternatePhone", user.AlternatePhone);
            parameters.Add("AddressLine1", user.AddressLine1);
            parameters.Add("AddressLine2", user.AddressLine2);
            parameters.Add("City", user.City);
            parameters.Add("State", user.State);
            parameters.Add("ZipCode", user.ZipCode);
            parameters.Add("Country", user.Country);
            parameters.Add("DateOfBirth", user.DateOfBirth);
            parameters.Add("IsActive", user.IsActive);
            parameters.Add("UpdatedBy", user.UpdatedBy);

            var result = await _connection.ExecuteAsync(
                "dbo.sp_User_Update",
                parameters,
                commandType: CommandType.StoredProcedure);

            return result > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var result = await _connection.QuerySingleAsync<bool>(
                "dbo.sp_User_Delete",
                new
                {
                    Id = id,
                    UpdatedBy = "admin"
                },
                commandType: CommandType.StoredProcedure);

            return result;
        }
        public async Task<PagedResultDto<UsersEntity>> GetAllPagedAsync(
        UsersFilterDto filter)
        {
            using var multi = await _connection.QueryMultipleAsync(
                "dbo.sp_User_GetPaged",
                new
                {
                    UserName = filter.UserName,
                    Email = filter.Email,
                    FirstName = filter.FirstName,
                    LastName = filter.LastName,
                    IsActive = filter.IsActive,
                    PageNumber = filter.PageNumber,
                    PageSize = filter.PageSize
                },
                commandType: CommandType.StoredProcedure);

            var data = (await multi.ReadAsync<UsersEntity>()).ToList();

            var totalRecords =
                await multi.ReadFirstOrDefaultAsync<int>();

            return new PagedResultDto<UsersEntity>
            {
                Data = data,
                TotalRecords = totalRecords
            };
        }

        public async Task<bool> UpdateLastLoginAsync(int id)
        {
            var result = await _connection.ExecuteAsync(
                "dbo.sp_User_UpdateLastLogin",
                new
                {
                    Id = id
                },
                commandType: CommandType.StoredProcedure);

            return result > 0;
        }
    }



}
