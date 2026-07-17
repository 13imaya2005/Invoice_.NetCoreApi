using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Entities;
namespace InvoiceCoreAPI.Contracts;

public interface IUsersRepository

{

    Task<int> AddAsync(Users users);
    Task<IEnumerable<Users>> GetAllAsync();
    Task<Users?> GetByIdAsync(int id);
    Task<bool> UpdateAsync(Users users);
    Task<bool> DeleteAsync(int id);
    Task<PagedResultDto<Users>> GetAllPagedAsync(

        string? UserName,

        string? FirstName,

        string? LastName,

        string? PhoneNumber,

        string? City,

        DateTime? DateOfBirth,

        bool? IsActive,

        int pageNumber,

        int pageSize);

}




