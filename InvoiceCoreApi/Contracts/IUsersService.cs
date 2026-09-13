using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.DTO;
using InvoiceCoreAPI.Models;

namespace InvoiceCoreAPI.Contracts;

public interface IUsersService

{
    Task<ApiResponse<IEnumerable<UserDto>>> GetAllAsync();
    Task<ApiResponse<UserDto>> GetByIdAsync(int id);
    Task<ApiResponse<UserDto>> AddAsync(UsersCreateDto dto);
    Task<ApiResponse<UserDto>> UpdateAsync(
        int id,
        UsersUpdateDto dto);
    Task<ApiResponse<bool>> DeleteAsync(int id);
    Task<ApiResponse<PagedResultDto<UserDto>>> GetAllPagedAsync(
        UsersFilterDto filter);
    Task<UserDto?> ValidateUserAsync(
        string userName,
        string password);



}
