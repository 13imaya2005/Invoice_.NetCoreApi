using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.DTO;

namespace InvoiceCoreAPI.Contracts;

public interface IUsersService

{

    Task<int> AddAsync(UserDto dto);

    Task<IEnumerable<UserDto>> GetAllAsync();

    Task<UserDto?> GetByIdAsync(int id);

    Task<bool> UpdateAsync(UserDto dto);

    Task<bool> DeleteAsync(int id);

    Task<PagedResultDto<UserDto>> GetAllPagedAsync(

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
